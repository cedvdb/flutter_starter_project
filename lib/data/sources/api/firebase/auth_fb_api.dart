import '../api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';
import 'package:eureka_app/utils/logger.dart';

class AuthFbAPI extends AuthAPI {
  FirebaseAuth get _authFire => FirebaseAuth.instance;

  AuthFbAPI();

  @override
  watchAuthUser() {
    return _authFire
        .authStateChanges()
        .map((user) => AuthUser(id: user?.uid))
        .doOnData((event) {
      log.d(event);
    });
  }

  @override
  Future<void> signIn(AuthProvider provider) {
    switch (provider) {
      case AuthProvider.google:
        return _signInWithGoogle();
      default:
        throw 'Provider not supported';
    }
  }

  @override
  Future<void> signOut() {
    return Future.wait([
      _authFire.signOut(),
      GoogleSignIn().signOut(),
    ]);
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return await _authFire.signInWithCredential(credential);
  }
}
