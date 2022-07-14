// package imports
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// application imports
import '../../authentication/authentication_provider.dart';

class SignOutButton extends ConsumerWidget {
  const SignOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
        builder: (context, ref, _) {
          final _auth = ref.watch(authenticationProvider);
          return IconButton(
              onPressed: () => _auth.signOut(),
              icon: const Icon(Icons.person)
          );
        }
    );
  }
}

