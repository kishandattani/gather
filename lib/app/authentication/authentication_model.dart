// package imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// application imports
import '../../widgets/alert_dialog/alert_dialog.dart';

class Authentication {

  // set instance of firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get a stream of the current user
  // we can use this to see if a user is logged in or not
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // 5 functions below
  // 1. singUpWithEmailAndPassword
  // 2. signInWithEmailAndPassword
  // 3. signInWithGoogle
  // 4. signInAnonymously
  // 9. signOut

  // singUpWithEmailAndPassword
  Future<void> signUpWithEmailAndPassword (String email, String password, BuildContext context) async {
    try {
      _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      await showExceptionAlertDialog(
        context : context,
        title: 'Error Occurred',
        exception: e.toString(),
      );
    } catch (e) {
      if (e == 'email-already-in-use') {
        // print('Email already in use.')
      } else {
        // print('Error: $e');
      }
    }
  }

  // signInWithEmailAndPassword
  Future<void> signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showExceptionAlertDialog(
        context : context,
        title: 'Error Occurred',
        exception: e.toString(),
      );
    }
  }

  // signInWithGoogle
  Future<void> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      await showExceptionAlertDialog(
        context : context,
        title: 'Error Occurred',
        exception: e.toString(),
      );
    }
  }

  // signInAnonymously
  Future<void> signInAnonymously (BuildContext context) async {
    try {
      _auth.signInAnonymously();
    } on FirebaseAuthException catch(e) {
      await showExceptionAlertDialog(
        context : context,
        title: 'Error Occurred',
        exception: e.toString(),
      );
    } catch (e) {
      if (e == 'operation-not-allowed') {
        // print('operation-not-allowed.')
      } else {
        // print('Error: $e');
      }
    }
  }

  // signOut
  Future<void> signOut() async {
    await _auth.signOut();
  }

}