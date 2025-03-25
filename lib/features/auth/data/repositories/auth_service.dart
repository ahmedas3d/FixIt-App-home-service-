import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  static SupabaseClient client() {
    final supabase = Supabase.instance.client;
    return supabase;
  }

  static Future<AuthResponse> googleSignIn() async {
    const serverClientId =
        '1087004112002-4h5l8ilskejmpeqt2svhond8i68ls7ea.apps.googleusercontent.com';
    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: serverClientId,
    );

    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw 'Google sign-in was canceled or failed.';
      }
      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      final AuthResponse res = await client().auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      return res; // إرجاع AuthResponse الذي يحتوي على بيانات المستخدم
    } catch (e) {
      throw 'Failed to sign in with Google: $e';
    } finally {
      await googleSignIn.signOut();
    }
  }
}
