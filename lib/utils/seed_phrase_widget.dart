import 'package:async_redux/async_redux.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../business/models/appstate.dart';
import '../client/connectors/user_details_connector.dart';
import 'package:tezart/tezart.dart';

class SeedPhraseWidget extends StatefulWidget {
  SeedPhraseWidget({Key? key, required this.selectedOption}) : super(key: key);
  final int selectedOption;

  @override
  _SeedPhraseWidgetState createState() => _SeedPhraseWidgetState();
}

class _SeedPhraseWidgetState extends State<SeedPhraseWidget> {
  String? mnemonic;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserDetailsModel>(
      vm: () => UserDetailsVM(),
      builder: (context, state) {
        return widget.selectedOption == 0
            ? Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsetsDirectional.fromSTEB(30, 24, 30, 0),
                      padding: EdgeInsetsDirectional.fromSTEB(32, 16, 32, 16),
                      width: MediaQuery.of(context).size.width - 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                        ),
                      ),
                      child: AutoSizeText(mnemonic ?? ""),
                    ),
                    TextButton(
                      onPressed: () {
                        Keystore keystore = Keystore.random();
                        print(keystore.mnemonic);
                        setState(() {
                          mnemonic = keystore.mnemonic;
                        });
                        state.saveMnemonic(keystore);
                      },
                      child: Text("Show Backup Phrase"),
                    ),
                  ],
                ),
              )
            : widget.selectedOption == 1
                ? Container(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Future.delayed(Duration(seconds: 2), () {
                              Keystore keystore = Keystore.random();
                              print(keystore.mnemonic);
                              setState(() {
                                mnemonic = keystore.mnemonic;
                              });
                            });
                          },
                          child: Text("Enter Backup Phrase or Seed Phrase"),
                        ),
                        TextFormField(
                          decoration: InputDecoration(),
                        )
                      ],
                    ),
                  )
                : Container();
      },
    );
  }
}
