// package imports
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// application imports
import '../../../../constants/constants.dart';
import '../../../../providers/database_providers.dart';
import '../../../../services/firestore_database.dart';
import '../../../../widgets/list_item_builder.dart';
import '../../../error/error_page.dart';
import '../counter_providers.dart';
import '../sign_out_button.dart';
import 'colour_model.dart';
import 'colour_provider.dart';

class ColourListPage extends ConsumerWidget {

  // helper function to add a new colour card
  Future<void> _add(BuildContext context, WidgetRef ref) async {
    // create a document id using the current date and time
    final id = documentIdFromCurrentDate();
    // get the data from the counter provider
    final redCount = ref.watch(redCounterProvider);
    final greenCount = ref.watch(greenCounterProvider);
    final blueCount = ref.watch(blueCounterProvider);
    // create a new colour using the data above
    Colour colour = Colour(id: id, red: redCount, green: greenCount, blue: blueCount, created: DateTime.now());
    // try and create the new entry in the database
    try {
      final database = ref.read<FirestoreDatabase?>(databaseProvider)!;
      await database.setColour(colour);
    } catch (e, trace) {
      ErrorPage(e, trace);
    }
  }

  // helper function to delete a colour card
  Future<void> _delete(BuildContext context, WidgetRef ref, Colour colour) async {
    try {
      final database = ref.read<FirestoreDatabase?>(databaseProvider)!;
      await database.deleteColour(colour);
    } catch (e, trace) {
      ErrorPage(e, trace);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(

      // simple appbar with title and sign out button
      appBar: AppBar(
          title: const Text(constPageNameColour),
          actions:const <Widget>[
            SignOutButton()
          ]
      ),

      // body hold the list of colours
      body: Center(
        // Consumer is a widget that allows you reading providers.
        child: Consumer(builder: (context, ref, _) {
          return _buildContents(context, ref);
        }),
      ),

      // fab to add new entries
      floatingActionButton: FloatingActionButton(
        // The read method is an utility to read a provider without listening to it
        onPressed: () => _add(context, ref),
        child: const Icon(constFabIconColour),
        backgroundColor: constFabColorColour,
      ),
    );
  }

  // build the list
  Widget _buildContents(BuildContext context, WidgetRef ref) {

    // get the list of colours from the provider
    final cardsAsyncValue = ref.watch(coloursStreamProvider);

    // use the list builder to show the list of colours
    return ListItemsBuilder<Colour>(
      // use the list from the provider
      data: cardsAsyncValue,
      // allow each tile to be dismissible
      itemBuilder: (context, colour) => Dismissible(
        key: Key('colour-${colour.id}'),
        direction: DismissDirection.endToStart,
        // delete the card when it is dismissed
        onDismissed: (direction) => _delete(context, ref, colour),
        // show all the tiles
        child: ListTile(
          // get the string from the colour class
          title: Text(colour.getColorString()),
          // use this to set the colour of the card
          tileColor: Color.fromRGBO(colour.getColorRed(), colour.getColorGreen(), colour.getColorBlue(), 50),
        )
      ),
    );
  }

}