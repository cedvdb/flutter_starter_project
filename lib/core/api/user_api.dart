import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eureka_app/core/auth/auth.dart';
import 'package:rxdart/rxdart.dart';

// TODO add users if not exist

class UserAPI {
  // Create a CollectionReference called users that references the firestore collection
  final user$ = Auth.user$.switchMap((user) {
    print("------user: " + user.uid);
    if (user == null) {
      return Stream.value(null);
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .snapshots();
  });
}
