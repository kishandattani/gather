// package imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gather/app/authentication/authentication_provider.dart';
import 'package:gather/app/error/error_page.dart';
import 'package:gather/app/loading/loading_page.dart';

// application imports
import '../home/home_page.dart';
import 'authentication_login_page.dart';
import 'authentication_flutterfire_ui.dart';

class AuthenticationChecker extends ConsumerWidget {
  const AuthenticationChecker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // get the current state of authentication
    final _authState = ref.watch(authStateProvider);

    // if the data is a user then send to the home page
    // -- when the user logs out the state will change and the check is done again
    // if the data is null then send to the login page.
    // -- when the user logs in the state will change and the check is done again
    // if we are still waiting on the provider then go to the loading page
    // if there is an error go to the error page
    return _authState.when(
      data: (data) {
        if (data != null) return const HomePage();
        return const AuthenticationFlutterFireUi();
      },
      loading: () => const LoadingPage(),
      error: (e, trace) => ErrorPage(e, trace)
    );
  }
}