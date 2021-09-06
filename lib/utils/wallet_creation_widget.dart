import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tezpay/business/models/appstate.dart';
import 'package:tezpay/client/connectors/user_details_connector.dart';
import 'package:tezpay/models/wallet_option_model.dart';

class WalletCreationWidget extends StatefulWidget {
  @override
  WalletCreationWidgetState createState() => WalletCreationWidgetState();
}

class WalletCreationWidgetState extends State<WalletCreationWidget> {
  List<WalletOptionModel> periodModal = [];
  int selectIndex = 0;
  int containerIndex = 0;

  Color screenColor = Color(0xFFEBA791);

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    periodModal.add(WalletOptionModel(
      title: 'Create a Wallet',
      subTitle: 'Create a new wallet to start your crypto journey',
    ));
    periodModal.add(
      WalletOptionModel(
        title: 'Restore Wallet',
        subTitle: "Restore your existing wallet with a seed phrase",
      ),
    );
    periodModal.add(
      WalletOptionModel(
        title: 'Import Hardware Wallet',
        subTitle: 'Import your existing hardware wallet like Ledger Nano',
      ),
    );
    setStatusBarColor(Color(0xFFFBC5BB));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    // setStatusBarColor(appStore.scaffoldBackground!);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserDetailsModel>(
      vm: () => UserDetailsVM(),
      onInit: (store) {
        selectIndex = store.state.userDetailsState.selectedOption;
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              height: context.height(),
              width: context.width(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    16.height,
                    Text('Let\'s get going!',
                            style: boldTextStyle(size: 24, color: screenColor))
                        .paddingLeft(12.0),
                    16.height,
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: periodModal.length,
                      shrinkWrap: true,
                      itemBuilder: (_, int index) {
                        bool value = selectIndex == index;
                        return Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: value
                                  ? screenColor.withOpacity(0.3)
                                  : context.cardColor,
                              borderRadius:
                                  BorderRadius.circular(defaultRadius),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      padding: EdgeInsets.all(2),
                                      child: Icon(
                                        Icons.check,
                                        size: 14,
                                      ).visible(value).center(),
                                      decoration: BoxDecoration(
                                        color: context.cardColor,
                                        shape: BoxShape.circle,
                                        border: value
                                            ? Border.all(color: Colors.white)
                                            : Border.all(color: Colors.blue),
                                      ),
                                    ),
                                    12.width,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            periodModal[index].title.validate(),
                                            style: boldTextStyle(size: 16)),
                                        Text(
                                            periodModal[index]
                                                .subTitle
                                                .validate(),
                                            style: secondaryTextStyle()),
                                      ],
                                    ).expand(),
                                  ],
                                ),
                              ],
                            )).onTap(
                          () {
                            selectIndex = index;
                            print("initial : $selectIndex");
                            state.updateOption(selectIndex);
                            setState(() {});
                          },
                          borderRadius: radius(16),
                        ).paddingSymmetric(horizontal: 16, vertical: 4);
                      },
                    )
                  ],
                ).paddingBottom(16),
              ),
            ),
          ),
        );
      },
    );
  }
}
