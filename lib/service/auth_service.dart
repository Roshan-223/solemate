import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store the login status in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true); // User is logged in
      
      return userCredential.user;
    } catch (e) {
      print("Sign in error: $e");
      return null;
    }
  }

  Future<User?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Store the login status in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', true); // User is logged in

      return userCredential.user;
    } catch (e) {
      print("Sign up error: $e");
      return null;
    }
  }
 Future<User?> signInWithGoogle() async {
  try {
    // Start Google Sign-In
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      print("Google Sign-In was canceled.");
      return null;
    }

    // Obtain the authentication details
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the credential
    UserCredential userCredential = await _auth.signInWithCredential(credential);

    // Retrieve user info, safely handle null values
    final user = userCredential.user;
    final email = user?.email ?? 'No email available'; // Safe access
    final displayName = user?.displayName ?? 'No name available'; // Safe access

    // Store the login status in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true); // User is logged in

    print('Signed in user: $displayName, email: $email');

    return user;
  } catch (e) {
    print("Google Sign-In error: $e");
    return null;
  }
}

  Future<void> signOut() async {
    await _auth.signOut();

    // Clear the login status in SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false); // User is logged out
  }

  Stream<User?> get user => _auth.authStateChanges();
}
