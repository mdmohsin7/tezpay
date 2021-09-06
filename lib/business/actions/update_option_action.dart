import 'package:async_redux/async_redux.dart';
import 'package:tezpay/business/models/appstate.dart';
import 'package:tezpay/business/models/user_details_state.dart';

class UpdateOptionAction extends ReduxAction<AppState> {
  final int selectedOption;

  UpdateOptionAction(this.selectedOption);
  @override
  AppState reduce() {
    return state.copy(
      userDetailsState: UserDetailsState(
        selectedOption: selectedOption,
        mnemonic: state.userDetailsState.mnemonic,
      ),
    );
  }
}
