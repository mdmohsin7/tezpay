import 'package:async_redux/async_redux.dart';
import 'package:tezpay/business/actions/save_mnemnic_action.dart';
import 'package:tezpay/business/actions/update_option_action.dart';
import 'package:tezpay/business/models/appstate.dart';
import 'package:tezart/tezart.dart';

class UserDetailsVM extends VmFactory<AppState, UserDetailsModel> {
  @override
  UserDetailsModel fromStore() {
    return UserDetailsModel(
      selectedOption: state.userDetailsState.selectedOption,
      updateOption: (int value) => dispatch(UpdateOptionAction(value)),
      saveMnemonic: (Keystore ks) => dispatch(SaveMnemonicAction(keystore: ks)),
    );
  }
}

class UserDetailsModel extends Vm {
  final int selectedOption;
  final Function(int) updateOption;
  final Function(Keystore) saveMnemonic;
  UserDetailsModel(
      {required this.selectedOption,
      required this.updateOption,
      required this.saveMnemonic});
}
