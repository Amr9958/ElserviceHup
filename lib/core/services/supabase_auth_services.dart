import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../constant/constant.dart';
import '../errors/exception.dart';

class SupabaseAuthServices {
  final client = Supabase.instance.client;

  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await client.auth.signUp(
        email: email,
        password: password,
      );
      return response.user!;
    } on AuthException catch (e) {
      throw CustomException(message: _mapSupabaseAuthErrorToString(e.code!));
    }
  }

  Future<User> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response.user!;
    } on AuthException catch (e) {
      throw CustomException(message: _mapSupabaseAuthErrorToString(e.code!));
    }
  }

  Future<User> loginWithGoogle() async {
    try {
      const webClientId =
          '523023284814-q5flar1qif55qao6t81049nc826p20tk.apps.googleusercontent.com';

      const iosClientId =
          '523023284814-q5flar1qif55qao6t81049nc826p20tk.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: webClientId,
        serverClientId: webClientId,
      );

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw 'Google Sign-In failed, user canceled.';
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final String? accessToken = googleAuth.accessToken;
      final String? idToken = googleAuth.idToken;

      if (accessToken == null || idToken == null) {
        throw 'No Access Token or ID Token found.';
      }
      final response = await client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      return response.user!;
    } on AuthException catch (e) {
      throw CustomException(message: _mapSupabaseAuthErrorToString(e.code!));
    }
  }

  Future<User?> signInWithFacebook() async {
    try {
      final response = await client.auth.signInWithOAuth(
        OAuthProvider.facebook,
        redirectTo: kIsWeb ? null : 'com.group.Elservices://login-callback',
        authScreenLaunchMode: kIsWeb
            ? LaunchMode.platformDefault
            : LaunchMode.externalApplication,
      );
      log(response.toString());
      if (response == true) {
        return client.auth.currentUser;
      } else {
        return null;
      }
    } on AuthException catch (e) {
      throw CustomException(message: _mapSupabaseAuthErrorToString(e.code!));
    }
  }

  String _mapSupabaseAuthErrorToString(String errorCode) {
    final bool arabic = isArabic();

    switch (errorCode) {
      case 'anonymous_provider_disabled':
        return arabic
            ? 'تم تعطيل تسجيل الدخول كزائر.'
            : 'Anonymous sign-ins are disabled.';
      case 'bad_code_verifier':
        return arabic
            ? 'رمز التحقق غير صحيح.'
            : 'The code verifier is incorrect.';
      case 'bad_json':
        return arabic
            ? 'البيانات المدخلة ليست بتنسيق JSON صالح.'
            : 'The request body is not valid JSON.';
      case 'bad_jwt':
        return arabic
            ? 'رمز التوثيق غير صالح.'
            : 'The JWT in the Authorization header is invalid.';
      case 'email_exists':
        return arabic
            ? 'البريد الإلكتروني مسجل بالفعل.'
            : 'The email address already exists.';
      case 'email_not_confirmed':
        return arabic
            ? 'لم يتم تأكيد البريد الإلكتروني بعد.'
            : 'The email address is not confirmed.';
      case 'flow_state_expired':
        return arabic
            ? 'حالة التدفق قد انتهت، الرجاء تسجيل الدخول مرة أخرى.'
            : 'The flow state has expired, please sign in again.';
      case 'identity_already_exists':
        return arabic
            ? 'هذه الهوية مرتبطة بالفعل بحساب آخر.'
            : 'This identity is already linked to another user.';
      case 'invalid_credentials':
        return arabic
            ? 'بيانات الاعتماد غير صحيحة.'
            : 'Invalid login credentials.';
      case 'mfa_challenge_expired':
        return arabic
            ? 'تحدي التحقق متعدد العوامل قد انتهت صلاحيته.'
            : 'The multi-factor authentication challenge has expired.';
      case 'otp_expired':
        return arabic
            ? 'رمز OTP قد انتهت صلاحيته.'
            : 'The OTP code has expired.';
      case 'session_expired':
        return arabic ? 'انتهت صلاحية الجلسة.' : 'The session has expired.';
      case 'signup_disabled':
        return arabic
            ? 'تسجيل الحسابات الجديدة تم تعطيله.'
            : 'Signups are disabled on the server.';
      case 'user_not_found':
        return arabic
            ? 'لم يتم العثور على مستخدم بهذا البريد الإلكتروني.'
            : 'User not found for this email.';
      case 'weak-password':
        return arabic
            ? 'كلمة المرور ضعيفة جدًا.'
            : 'The password provided is too weak.';
      default:
        return arabic ? 'حدث خطأ غير معروف.' : 'An unknown error occurred.';
    }
  }
}
