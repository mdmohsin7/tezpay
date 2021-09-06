import 'package:equatable/equatable.dart';
import 'package:tezart/tezart.dart';

class UserDetailsState extends Equatable {
  final int selectedOption;
  final String mnemonic;

  UserDetailsState({required this.selectedOption, required this.mnemonic});

  @override
  List<Object?> get props => [selectedOption, mnemonic];

  static initialState() {
    return UserDetailsState(selectedOption: 0, mnemonic: "");
  }
}
