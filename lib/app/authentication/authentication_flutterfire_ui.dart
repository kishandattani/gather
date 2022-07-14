// package imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';

// application imports
import '../../constants/constants.dart';
import 'authentication_provider.dart';

class AuthenticationFlutterFireUi extends ConsumerWidget {
  const AuthenticationFlutterFireUi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
            child: Consumer(builder: (context, ref, _) {
              final _auth = ref.watch(authenticationProvider);
              // onPressed: () => _auth.signInAnonymously(context)
              return SignInScreen(
                providerConfigs: const [
                  EmailProviderConfiguration(),
                  GoogleProviderConfiguration(clientId: constGoogleClientID)
                ],
                footerBuilder: (context, _) {
                  return OutlinedButton(
                      child: Text('Start without an account'),
                      onPressed: () => _auth.signInAnonymously(context)
                  );
                },
              );
            })
        )
    );
  }
}
