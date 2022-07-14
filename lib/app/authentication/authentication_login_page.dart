// package imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// application imports
import 'authentication_provider.dart';

class AuthenticationLoginPage extends ConsumerWidget {
  const AuthenticationLoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Consumer(builder: (context, ref,_) {
            final _auth = ref.watch(authenticationProvider);
            return Center(
                child: TextButton(
                      onPressed: () => _auth.signInAnonymously(context),
                    child: const Text("Log In")
                )
            );
          })
      )
      );
  }
}

