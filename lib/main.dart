import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tezpay/client/screens/main_page.dart';

import 'business/models/appstate.dart';
import 'package:tezart/tezart.dart';

import 'client/screens/wallet_details_page.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  await initialize();
  Keystore.random().publicKey;
  final client = TezartClient('http://localhost:20000/');

  runApp(MyApp());
}

var state = AppState.initialState();
var store = Store<AppState>(
  initialState: state,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TezPay',
        home: store.state.userDetailsState.mnemonic.isEmpty
            ? WalletDetailsPage()
            : MainPage(),
        scrollBehavior: SBehavior(),
      ),
    );
  }
}
