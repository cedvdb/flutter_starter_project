import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

enum AuthState { AUTHENTICATED, UNAUTHENTICATED }

class Auth {
  static FirebaseAuth _authFire = FirebaseAuth.instance;
  static Stream<User> user$ =
      _authFire.authStateChanges().startWith(_authFire.currentUser);
  static Stream<AuthState> authStateChange$ = user$.map((state) =>
      state != null ? AuthState.AUTHENTICATED : AuthState.UNAUTHENTICATED);

  static bool get isAuthenticated {
    return _authFire.currentUser != null;
  }

  static Future<UserCredential> signInWithGoogle() async {
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

  static Future<void> signOut() {
    return _authFire.signOut();
  }
}
