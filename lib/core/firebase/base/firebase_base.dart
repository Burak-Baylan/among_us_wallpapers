import 'package:cloud_firestore/cloud_firestore.dart';
import '../firestore/manager/firebase_manager.dart';
import '../firestore/service/firebase_service.dart';

abstract class FirebaseBase {
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  FirestoreService get firestoreService => FirestoreService.instance;
  FirestoreService get firebaseService => FirestoreService.instance;
  FirebaseManager get firebaseManager => FirebaseManager.instance;
}
