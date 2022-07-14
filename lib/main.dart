// package imports
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// application imports
import 'app/authentication/authentication_checker.dart';
import 'app/error/error_page.dart';
import 'app/loading/loading_page.dart';
import 'providers/firebase_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child:MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // watch the firebaseInitializerProvider to see if firebase has been initialized
    // async value with 3 types of results
    // - the result is a Future<FirebaseApp>
    // - the result is a Future<Error>
    // - the result is still loading
    final initialize = ref.watch(firebaseInitializerProvider);

    // call the Material App
    return MaterialApp(
      title: 'Flutter Starter App',
      debugShowCheckedModeBanner: false,

      // theme engine handled by flex_color_scheme
      themeMode: ThemeMode.light,
      theme: FlexThemeData.light(scheme: FlexScheme.damask),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.damask),

      // lets check if Firebase has been initialized
      // - if it has then send to authentication check to see if the user is logged in or not
      // - if it is still loading then send to the loading screen
      // - if it erred send to the error screen
      home: initialize.when(
        data: (data) => const AuthenticationChecker(),
        loading: () => const LoadingPage(),
        error: (e, stackTrace) => ErrorPage(e, stackTrace)),
    );
  }
}
