// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:nps_app/Controllers/API%20Controllers/fetchname.dart';
import 'package:nps_app/Controllers/Decryption%20Controllers/decryptname.dart';
import '../../Model/reviewsModel/badreview.dart';
import '../../Model/reviewsModel/defaultreview.dart';
import '../../Model/reviewsModel/greatreview.dart';
import '../../Model/reviewsModel/positivereview.dart';
import '../../Controllers/API Controllers/savefeedback.dart';
import '../Model/alertModel/alert_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Model/alertModel/feedback_alert.dart';
import 'FullScreenModal.dart';
import 'radio_rating.dart';
import 'package:nps_app/Controllers/Decryption Controllers/decryptfeedback.dart';

class RadioComment<T> extends StatefulWidget {
  const RadioComment(
      {Key? key, required this.ExtractedName, required this.ExtractedUniqueId})
      : super(key: key);
  final String? ExtractedName;
  final String ExtractedUniqueId;

  @override
  State<RadioComment<T>> createState() => _RadioCommentState<T>();
}

class _RadioCommentState<T> extends State<RadioComment<T>> {
  String? _groupRate;

  // String get ExtractedName => ExtractedName;

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupRate = value!);
  }

  int? _rate = -1;
  callback(varRate) {
    setState(() {
      _rate = varRate;
    });
  }

  final commentController = TextEditingController();
  final uniqueIdcontroller = TextEditingController();
  final FetchNames _fetchNames = FetchNames();
  final DecryptName _decryptName = DecryptName(); // Api request Class
  final SaveFeedback _saveFeedback = SaveFeedback();
  final Decryptfeedback _decryptfeedback = Decryptfeedback();
  String uniqueId = '';
  String comment = '';
  String tempId = '';
  String fetchednamed = '';
  late String? feedback = '';
  late String? Name = '';
  // dynamic _showModal(BuildContext context) async {
  //   final result = await Navigator.of(context).push(FullScreenModal());
  // }

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
                          // '${widget.ExtractedUniqueId}',
                          'Name',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff002247),
                            fontFamily: 'Arial Narrow',
                          ),
                        ),
                        const SizedBox(
                          width: 55,
                        ),
                        Expanded(
                            child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            // enabled: false,
                            readOnly: true,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.done,
                            textCapitalization: TextCapitalization.characters,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(
                                  15.0, 10.0, 5.0, 10.0),
                              hintText: '${widget.ExtractedName}',
                              hintStyle: TextStyle(
                                  fontFamily: 'Arial Narrow',
                                  fontSize: 15,
                                  color: Name!.contains('PAN is invalid') ||
                                          Name!.contains('ARN is Invalid')
                                      ? Colors.red
                                      : const Color(0xff002247)),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffd7d9da)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffd7d9da)),
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Can we have your feedback on your experience?",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff002247),
                          fontFamily: 'Arial Narrow',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffd7d9da),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal:
                              3.2), // change this padding accordingly to resize the app in ipad
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Radiorating<String>(
                                value: '0',
                                groupValue: _groupRate,
                                onChanged: _valueChangedHandler(),
                                label: '0',
                                border: false,
                                bgcolor: const Color(0xffe04c32),
                                callbackFunction: callback,
                              ),
                              Radiorating<String>(
                                value: '1',
                                groupValue: _groupRate,
                                onChanged: _valueChangedHandler(),
                                label: '1',
                                border: false,
                                bgcolor: const Color(0xffe04c32),
                                callbackFunction: callback,
                              ),
                              Radiorating<String>(
                                value: '2',
                                groupValue: _groupRate,
                                onChanged: _valueChangedHandler(),
                                label: '2',
                                border: false,
                                bgcolor: const Color(0xffe04c32),
                                callbackFunction: callback,
                              ),
                              Radiorating<String>(
                                value: '3',
                                groupValue: _groupRate,
                                onChanged: _valueChangedHandler(),
                                label: '3',
                                border: false,
                                bgcolor: const Color(0xffE3B449),
                                callbackFunction: callback,
                              ),
                              Radiorating<String>(
                                value: '4',
                                groupValue: _groupRate,
                                onChanged: _valueChangedHandler(),
                                label: '4',
                                border: false,
                                bgcolor: const Color(0xffE3B449),
                                callbackFunction: callback,
                              ),
                              Radiorating<String>(
                                value: '5',
                                groupValue: _groupRate,
                                onChanged: _valueChangedHandler(),
                                label: '5',
                                border: false,
                                bgcolor: const Color(0xfff86400),
                                callbackFunction: callback,
                              ),
                              Radiorating<String>(
                                value: '6',
                                groupValue: _groupRate,
                                onChanged: _valueChangedHandler(),
                                label: '6',
                                border: false,
                                bgcolor: const Color(0xfff86400),
                                callbackFunction: callback,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.5, right: 0.5),
                                child: Container(
                                  color: const Color(0xffd7d9da),
                                  height: 50,
                                  width: 1,
                                ),
                              ),
                              Radiorating<String>(
                                value: '7',
                                groupValue: _groupRate,
                                onChanged: _valueChangedHandler(),
                                label: '7',
                                border: false,
                                bgcolor: const Color(0xff84e63d),
                                callbackFunction: callback,
                              ),
                              Radiorating<String>(
                                value: '8',
                                groupValue: _groupRate,
                                onChanged: _valueChangedHandler(),
                                label: '8',
                                border: false,
                                bgcolor: const Color(0xff84e63d),
                                callbackFunction: callback,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.5, right: 0.5),
                                child: Container(
                                  color: const Color(0xffd7d9da),
                                  height: 50,
                                  width: 1,
                                ),
                              ),
                              Radiorating<String>(
                                value: '9',
                                groupValue: _groupRate,
                                onChanged: _valueChangedHandler(),
                                label: '8',
                                border: false,
                                bgcolor: const Color(0xff719a4b),
                                callbackFunction: callback,
                              ),
                              Radiorating<String>(
                                value: '10',
                                groupValue: _groupRate,
                                onChanged: _valueChangedHandler(),
                                label: '10',
                                border: false,
                                bgcolor: const Color(0xff719a4b),
                                callbackFunction: callback,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 0),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15), // Resize this responsive
                                      child: SizedBox(
                                        child: Container(
                                          height: 8,
                                          width: 187,
                                          decoration: const BoxDecoration(
                                              border: Border(
                                            bottom: BorderSide(
                                              color: Color(0xffd7d9da),
                                            ),
                                            left: BorderSide(
                                              color: Color(0xffd7d9da),
                                            ),
                                            right: BorderSide(
                                              color: Color(0xffd7d9da),
                                            ),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30), // Resize this responsive
                                  child: SizedBox(
                                    child: Container(
                                      height: 8,
                                      width: 34,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xffd7d9da),
                                        ),
                                        left: BorderSide(
                                          color: Color(0xffd7d9da),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xffd7d9da),
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30), // Resize this responsive
                                  child: SizedBox(
                                    child: Container(
                                      height: 8,
                                      width: 34,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xffd7d9da),
                                        ),
                                        left: BorderSide(
                                          color: Color(0xffd7d9da),
                                        ),
                                        right: BorderSide(
                                          color: Color(0xffd7d9da),
                                        ),
                                      )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 0),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50), // Resize this responsive
                                      child: Text('Needs improvement',
                                          style: TextStyle(
                                            fontFamily: 'Arial Narrow',
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            fontSize: 12,
                                          )),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 95), // Resize this responsive
                                  child: Text('Happy',
                                      style: TextStyle(
                                        fontFamily: 'Arial Narrow',
                                        color: Colors.black.withOpacity(0.3),
                                        fontSize: 12,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30), // Resize this responsive
                                  child: Text('Delighted',
                                      style: TextStyle(
                                        fontFamily: 'Arial Narrow',
                                        color: Colors.black.withOpacity(0.3),
                                        fontSize: 12,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                if (_rate! < 0)
                  const DefaultReview()
                else if (_rate! <= 6)
                  const BadReview()
                else if (_rate! >= 7 && _rate! < 9)
                  const PositiveReview()
                else
                  const GreatReview(),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Color(0xff002247),
                    fontFamily: 'Arial Narrow',
                  ),
                  controller: commentController,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  // maxLengthEnforcement:true,
                  maxLength: 1000,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    counterStyle: TextStyle(color: Color(0xffd7d9da)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd7d9da)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd7d9da)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 110, right: 110, bottom: 15),
        child: Material(
          color: const Color(0xffE3B449),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: InkWell(
            onTap: () async {
              // (Start) Save the Feedback
              const source = 'Other_Application';
              comment = commentController.text;
              String? uniqueId = widget.ExtractedUniqueId;

              int temp_rating = _rate!;
              if (temp_rating < 0) {
                await FeedbackAlerts.yesCanceldialog(
                    context, 'Please give rating.');
              } else if (comment.isEmpty) {
                await FeedbackAlerts.yesCanceldialog(
                    context, 'Please write few suggestions.');
              } else {
                Navigator.of(context).push(FullScreenModal());
                var savedfeedback = await _saveFeedback.saveFeedback(
                    widget.ExtractedUniqueId,
                    _rate,
                    comment,
                    source,
                    context,
                    'https://investors-stage.pgimindiamf.com/api/v1/general/customer/feedback');
                feedback = await _decryptfeedback.DecryptFeedback(
                    savedfeedback, context);
                print(widget.ExtractedUniqueId);
                print(_rate);
                print(comment);
                // setState(() => comment = '');
                // setState(() => tempId = '');
                // setState(() => fetchednamed = '');
                // setState(() => feedback = '');
                // setState(() => _rate = 0);
                // setState(() => _groupRate = '');
                // commentController.clear();
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
              }
            },
            child: const SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontFamily: 'Arial Narrow',
                    fontWeight: FontWeight.bold,
                    color: Color(0xff002247),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
