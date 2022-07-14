import 'package:gather/app/authentication/authentication_provider.dart';
import 'package:gather/services/firestore_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final databaseProvider = Provider<FirestoreDatabase?>((ref) {
  final auth = ref.watch(authStateProvider);

  if (auth.asData?.value?.uid != null) {
    return FirestoreDatabase(uid: auth.asData!.value!.uid);
  }
  return null;
});