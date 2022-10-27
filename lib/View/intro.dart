// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nps_app/View/radiocomment.dart';

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
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                          height: 44, // Resize (Responsive)
                          width: 30, // Resize (Responsive)
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          'PAN',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff002247),
                            fontFamily: 'Arial Narrow',
                          ),
                        ),
                        const SizedBox(
                          width: 62,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              style: const TextStyle(
                                color: Color(0xff002247),
                                fontFamily: 'Arial Narrow',
                              ),
                              controller: uniqueIdcontroller,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.characters,
                              onFieldSubmitted: (value) async {
                                // print(uniqueId);
                                Navigator.of(context).push(FullScreenModal());
                                tempId = uniqueIdcontroller.text;
                                uniqueId = tempId;
                                var encrep = await _fetchNames.fetchName(
                                  uniqueId,
                                  context,
                                );
                                Name = await _decryptName.decryptName(
                                    encrep!, context);
                                if (Name!.contains('PAN is invalid') ||
                                    Name!.contains('ARN is Invalid')) {
                                  await AlertDialogs.yesCanceldialog(context,
                                      'Please Enter Valid PAN / ARN Details.');
                                  uniqueIdcontroller.clear();
                                  setState(() {
                                    uniqueId = '';
                                    Name = '';
                                  });
                                } else if (Name!.contains('Technical Error.')) {
                                  await AlertDialogs.yesCanceldialog(context,
                                      'Technical Error. Please contact your Admin!');
                                  uniqueIdcontroller.clear();
                                  setState(() {
                                    uniqueId = '';
                                    Name = '';
                                  });
                                } else if (Name!.contains('PAN is Empty')) {
                                  await AlertDialogs.yesCanceldialog(
                                      context, 'Please Enter PAN.');
                                  uniqueIdcontroller.clear();
                                  setState(() {
                                    uniqueId = '';
                                    Name = '';
                                  });
                                } else if (Name!.contains(
                                    'No folio associated to this PAN')) {
                                  await AlertDialogs.yesCanceldialog(
                                      context, Name!);
                                  uniqueIdcontroller.clear();
                                  setState(() {
                                    uniqueId = '';
                                    Name = '';
                                  });
                                } else if (Name!.contains(
                                    'ARN Not Empaneled with PGIM India.')) {
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
                              },
                              decoration: const InputDecoration(
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
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffE3B449),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 20),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          )),
                      onPressed: () async {
                        // print(uniqueId);
                        Navigator.of(context).push(FullScreenModal());
                        tempId = uniqueIdcontroller.text;
                        uniqueId = tempId;
                        var encrep = await _fetchNames.fetchName(
                          uniqueId,
                          context,
                        );
                        Name = await _decryptName.decryptName(encrep!, context);
                        if (Name!.contains('PAN is invalid') ||
                            Name!.contains('ARN is Invalid')) {
                          await AlertDialogs.yesCanceldialog(
                              context, 'Please Enter Valid PAN / ARN Details.');
                          uniqueIdcontroller.clear();
                          setState(() {
                            uniqueId = '';
                            Name = '';
                          });
                        } else if (Name!.contains('Technical Error.')) {
                          await AlertDialogs.yesCanceldialog(context,
                              'Technical Error. Please contact your Admin!');
                          uniqueIdcontroller.clear();
                          setState(() {
                            uniqueId = '';
                            Name = '';
                          });
                        } else if (Name!.contains('PAN is Empty')) {
                          await AlertDialogs.yesCanceldialog(
                              context, 'Please Enter PAN.');
                          uniqueIdcontroller.clear();
                          setState(() {
                            uniqueId = '';
                            Name = '';
                          });
                        } else if (Name!
                            .contains('No folio associated to this PAN')) {
                          await AlertDialogs.yesCanceldialog(context, Name!);
                          uniqueIdcontroller.clear();
                          setState(() {
                            uniqueId = '';
                            Name = '';
                          });
                        } else {
                          print('Name is :- $Name');
                          print('Unique ID is :- $uniqueId');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RadioComment(
                                      ExtractedName: Name,
                                      ExtractedUniqueId: uniqueId)));
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
