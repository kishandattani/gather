// package imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// application imports
import '../../../../constants/constants.dart';
import '../counter_providers.dart';
import '../show_color_box.dart';
import '../sign_out_button.dart';

class GreenListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

      // simple appbar with title and sign out button
      appBar: AppBar(
          title: const Text(constPageNameGreen),
          actions:const <Widget>[
            SignOutButton()
          ]
      ),

      // body to show the string and colour in a box
      body: const ShowColorBox(),
      floatingActionButton: FloatingActionButton(
        // The read method is an utility to read a provider without listening to it
        onPressed: () => ref.read(greenCounterProvider.notifier).increment(),
        child: const Icon(constFabIconGreen),
        backgroundColor: constFabColorGreen,
      ),
    );
  }
}