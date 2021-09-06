import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tezpay/business/models/appstate.dart';
import 'package:tezpay/client/connectors/user_details_connector.dart';
import 'package:tezpay/utils/seed_phrase_widget.dart';
import 'package:tezpay/utils/wallet_creation_widget.dart';
import '../../utils/Colors.dart';
import '../../utils/Style.dart';

import 'main_page.dart';

class WalletDetailsPage extends StatefulWidget {
  @override
  _WalletDetailsPageState createState() => _WalletDetailsPageState();
}

class _WalletDetailsPageState extends State<WalletDetailsPage> {
  PageController pageController = PageController(initialPage: 0);
  int pageNumber = 0;

  List<Widget> buildDotIndicator() {
    List<Widget> list = [];
    for (int i = 0; i <= 1; i++) {
      list.add(i == pageNumber
          ? indicator(isActive: true)
          : indicator(isActive: false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return StoreConnector<AppState, UserDetailsModel>(
      vm: () => UserDetailsVM(),
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  height: double.infinity,
                  child: PageView(
                    onPageChanged: (index) => setState(() {
                      pageNumber = index;
                    }),
                    controller: pageController,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            left: 16,
                            bottom: 100,
                            right: 16,
                            top: size.height * 0.05),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(bottom: 60),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                child: WalletCreationWidget(),
                                width: 800,
                                height: 500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SeedPhraseWidget(
                        selectedOption: state.selectedOption,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                  padding: EdgeInsets.only(left: 20),
                  width: size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: opPrimaryColor,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Text('${pageNumber + 1}',
                            style: primaryTextStyle(
                                size: 16, color: opPrimaryColor)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: buildDotIndicator(),
                      ),
                      pageNumber != 1
                          ? TextButton(
                              onPressed: () {
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.fastOutSlowIn);
                              },
                              child: Text('Next',
                                  style: primaryTextStyle(
                                      size: 16, color: opBackgroundColor)),
                            )
                          : TextButton(
                              onPressed: () {
                                finish(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MainPage()));
                              },
                              child: Text('Finish',
                                  style: primaryTextStyle(
                                      size: 16, color: opBackgroundColor)),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
