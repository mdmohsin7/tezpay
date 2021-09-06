import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:tezpay/business/models/appstate.dart';
import 'package:tezpay/business/models/user_details_state.dart';
import 'package:tezart/tezart.dart';

class SaveMnemonicAction extends ReduxAction<AppState> {
  final Keystore keystore;

  SaveMnemonicAction({required this.keystore});
  @override
  Future<AppState> reduce() async {
    await FlutterKeychain.put(key: "xtzksm", value: keystore.mnemonic!);
    await FlutterKeychain.put(key: "xtzkssk", value: keystore.secretKey);
    print(await FlutterKeychain.get(key: "xtzksm"));
    print(await FlutterKeychain.get(key: "xtzkssk"));
    return state.copy(
      userDetailsState: UserDetailsState(
        selectedOption: state.userDetailsState.selectedOption,
        mnemonic: keystore.mnemonic!,
      ),
    );
  }
}
