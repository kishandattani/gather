import 'dart:async';

import 'package:gather/services/firestore_services.dart';
import 'package:gather/services/firestore_path.dart';
import 'package:gather/app/home/pages/colour/colour_model.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase {
  FirestoreDatabase({required this.uid});
  final String uid;

  final _service = FirestoreService.instance;

  Future<void> setColour(Colour colour) => _service.setData(
    path: FirestorePath.card(uid, colour.id),
    data: colour.toMap(),
  );

  Future<void> deleteColour(Colour colour) =>
      _service.deleteData(path: FirestorePath.card(uid, colour.id));

  Stream<Colour> colourStream({required String cardId}) =>
      _service.documentStream(
        path: FirestorePath.card(uid, cardId),
        builder: (data, documentId) => Colour.fromMap(data, documentId),
  );

  Stream<List<Colour>> coloursStream() =>
      _service.collectionStream(
        path: FirestorePath.cards(uid),
        builder: (data, documentId) => Colour.fromMap(data, documentId),
  );

}