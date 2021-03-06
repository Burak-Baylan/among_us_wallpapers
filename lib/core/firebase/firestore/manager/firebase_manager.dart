import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../error/custom_error.dart';
import '../../base/firebase_base.dart';

class FirebaseManager extends FirebaseBase {
  static FirebaseManager? _instance;
  static FirebaseManager get instance =>
      _instance = _instance == null ? FirebaseManager._init() : _instance!;
  FirebaseManager._init();

  Future increaseField({
    int count = 1,
    required DocumentReference documentReference,
    required String fieldName,
  }) async =>
      await firebaseService.updateValue(count, documentReference, fieldName);

  Future decraseField({
    int count = -1,
    required DocumentReference documentReference,
    required String fieldName,
  }) async {
    if (count > 0) {
      count = count - (count * 2);
    } else if (count == 0) {
      count = -1;
    }
    await firebaseService.updateValue(count, documentReference, fieldName);
  }

  Future<Map<String, dynamic>?> getADocument(
    DocumentReference<Object?> reference,
  ) async {
    var rawData = await firebaseService.getDocument(reference);
    if (rawData.error != null || rawData.data?.data() == null) return null;
    var data = rawData.data!.data() as Map<String, dynamic>;
    return data;
  }

  Future<CustomError> update(
          DocumentReference ref, Map<String, dynamic> data) async =>
      await firebaseService.updateDocument(ref, data);
}
