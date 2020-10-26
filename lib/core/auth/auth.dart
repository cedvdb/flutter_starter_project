import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

enum AuthState { PENDING, AUTHENTICATED, UNAUTHENTICATED }

class Auth {
  static Stream<AuthState> authState$ = FirebaseAuth.instance
      .authStateChanges()
      .doOnData((event) {
    print('user found: ${event?.uid}');
  }).map((state) =>
          state != null ? AuthState.AUTHENTICATED : AuthState.UNAUTHENTICATED);

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
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
