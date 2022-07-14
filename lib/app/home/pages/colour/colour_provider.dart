// package imports
import 'package:hooks_riverpod/hooks_riverpod.dart';

// application imports
import '../../../../providers/database_providers.dart';
import 'colour_model.dart';

final coloursStreamProvider = StreamProvider.autoDispose<List<Colour>>((ref) {
  final database = ref.watch(databaseProvider)!;
  return database.coloursStream();
});
