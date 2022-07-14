// package imports
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

// application imports
import 'authentication_model.dart';

enum AuthenticationAction {
  signIn,
  signUp,
  link,
}

class AuthenticationActionNotifier extends StateNotifier<AuthenticationAction> {
  AuthenticationActionNotifier(): super(AuthenticationAction.signIn);

  void signIn() => {state = AuthenticationAction.signIn};
  void signUp() => {state = AuthenticationAction.signUp};
  void link() => {state = AuthenticationAction.signUp};
}


// a provider for all the authentication functions
final authenticationProvider = Provider<Authentication>((ref) {
  return Authentication();
});

// a provider to stream user changes
final authStateProvider = StreamProvider<User?>((ref){
  return ref.read(authenticationProvider).authStateChanges;
});

// a provider for the current authentication - we can use it get basic user information
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});
