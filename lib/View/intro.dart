// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nps_app/Model/alertModel/feedback_alert.dart';
import 'package:nps_app/View/radiocomment.dart';
import 'package:sizer/sizer.dart';

import '../Controllers/API Controllers/fetchname.dart';
import '../Controllers/Decryption Controllers/decryptname.dart';
import '../Model/alertModel/alert_dialog.dart';
import 'FullScreenModal.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final uniqueIdcontroller = TextEditingController();
  final FetchNames _fetchNames = FetchNames();
  final DecryptName _decryptName = DecryptName();
  String uniqueId = '';
  String tempId = '';
  String fetchednamed = '';
  late String? Name = '';

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    RegExp regExp = RegExp(
      r"[A-Z]{5}[0-9]{4}[A-Z]{1}",
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          centerTitle: false,
          backgroundColor:
              const Color.fromARGB(255, 243, 234, 234).withOpacity(0),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          "assets/Logo/PGIM_Logo.svg",
                          height: currentWidth < 1024
                              ? 45
                              : 8.h, // Resize (Responsive)
                          width: currentWidth < 1024
                              ? 30
                              : 6.w, // Resize (Responsive)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: currentWidth < 1024 ? 200 : 26.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            // currentWidth.toString(),
                            'PAN_UAT',
                            style: TextStyle(
                              fontSize: currentWidth < 1024 ? 16 : 6.sp,
                              color: const Color(0xff002247),
                              fontFamily: 'Arial Narrow',
                            ),
                          ),
                          const SizedBox(
                            width: 62,
                          ),
                          SizedBox(
                            width: 60.w,
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: currentWidth < 1024 ? 16 : 6.sp,
                                color: const Color(0xff002247),
                                fontFamily: 'Arial Narrow',
                              ),
                              controller: uniqueIdcontroller,
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.characters,
                              maxLength: 10,
                              decoration: const InputDecoration(
                                counterText: "",
                                contentPadding:
                                    EdgeInsets.fromLTRB(15.0, 10.0, 5.0, 10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffd7d9da)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffd7d9da)),
                                ),
                              ),
                              onEditingComplete: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffE3B449),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 20),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            )),
                        onPressed: () async {
                          tempId = uniqueIdcontroller.text;
                          uniqueId = tempId;
                          if ((regExp.hasMatch(tempId)) &&
                              tempId.length == 10) {
                            final stopwatch = Stopwatch()..start();
                            Navigator.of(context).push(FullScreenModal());
                            var encrep = await _fetchNames.fetchName(
                              uniqueId,
                              context,
                            );
                            print('Encryption took ${stopwatch.elapsed}');
                            Name = await _decryptName.decryptName(
                                encrep!, context);
                            print('Decryption took ${stopwatch.elapsed}');
                            if (Name!
                                .contains('No folio associated to this PAN')) {
                              await AlertDialogs.yesCanceldialog(
                                  context, Name!);
                              uniqueIdcontroller.clear();
                              setState(() {
                                uniqueId = '';
                                Name = '';
                              });
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RadioComment(
                                          ExtractedName: Name,
                                          ExtractedUniqueId: uniqueId)));
                            }
                          } else {
                            AlertDialogs.yesCanceldialog(
                                context, 'Please enter valid PAN details');
                            uniqueIdcontroller.clear();
                            setState(() {
                              uniqueId = '';
                              Name = '';
                            });
                          }
                        },
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontFamily: 'Arial Narrow',
                            fontWeight: FontWeight.bold,
                            color: Color(0xff002247),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
