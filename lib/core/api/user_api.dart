import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eureka_app/core/auth/auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:eureka_app/core/models/user.dart';
import '_fs.dart';
import '_collections.dart';
// TODO add users if not exist

class UserAPI {
  // Create a CollectionReference called users that references the firestore collection
  final ReplayStream<User> user$ = Auth.user$.switchMap((authUser) {
    print("------user: " + authUser.uid);
    if (authUser == null) {
      return Stream.value(null);
    }
    return fs
        .collection(Col.users)
        .doc(authUser.uid)
        .snapshots()
        .map((snap) => User.fromMap(snap.data()))
        .shareReplay(maxSize: 1);
  });

  update(User user) {
    return fs.collection(Col.users).doc(user.id).update(user.toMap());
  }
}
