import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Colour extends Equatable {
  const Colour({
    required this.id,
    required this.red,
    required this.green,
    required this.blue,
    required this.created
  });

  final String id;
  final int red;
  final int green;
  final int blue;
  final DateTime created;

  @override
  List<Object> get props => [id, red, green, blue, created];

  @override
  bool get stringify => true;

  String getColorString() {
    return 'R:$red/G:$green/B:$blue';
  }

  int getColorRed() {
    return red;
  }

  int getColorGreen() {
    return green;
  }

  int getColorBlue() {
    return blue;
  }

  factory Colour.fromMap(Map<dynamic, dynamic>? value, String id) {
    if (value == null) {
      throw StateError('missing data for entryId: $id');
    }
    final Timestamp timestamp = value['created'];
    final createdMilliseconds = timestamp.millisecondsSinceEpoch;
    return Colour(
      id: id,
      red: value['red'] as int,
      green: value['green'] as int,
      blue: value['blue'] as int,
      created: DateTime.fromMillisecondsSinceEpoch(createdMilliseconds),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'red': red,
      'green': green,
      'blue': blue,
      'created': created
    };
  }
}