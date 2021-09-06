import 'package:equatable/equatable.dart';

import 'package:tezpay/business/models/user_details_state.dart';

class AppState extends Equatable {
  final UserDetailsState userDetailsState;
  AppState({
    required this.userDetailsState,
  });
  @override
  List<Object?> get props => [userDetailsState];

  static initialState() {
    return AppState(userDetailsState: UserDetailsState.initialState());
  }

  AppState copy({
    UserDetailsState? userDetailsState,
  }) {
    return AppState(
      userDetailsState: userDetailsState ?? this.userDetailsState,
    );
  }
}
