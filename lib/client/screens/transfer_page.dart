import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/Colors.dart';
import '../../utils/Style.dart';

import 'transfer_review_page.dart';

class TransferPage extends StatefulWidget {
  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: getAppBar('Transfer', pressed: () {
          finish(context);
        }),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 30),
                    margin: EdgeInsets.all(16),
                    decoration: boxDecoration(radius: 16),
                    child: textField2(
                      title: 'Receiver',
                      image: Icons.person_outline,
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.all(16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: opPrimaryColor,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransferReviewPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Next",
                      textAlign: TextAlign.center,
                      style: boldTextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
