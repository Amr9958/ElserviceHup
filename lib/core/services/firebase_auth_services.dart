import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../constant/constant.dart';
import '../errors/exception.dart';

class FirebaseAuthServices {
  // FirebaseAuthServices._();

  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: _mapFirebaseAuthExceptionToString(e));
    }
  }

  Future<User> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: _mapFirebaseAuthExceptionToString(e));
    }
  }

  Future<User> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  // Future<User> loginWithFacebook() async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

  //   return (await FirebaseAuth.instance
  //           .signInWithCredential(facebookAuthCredential))
  //       .user!;
  // }

  String _mapFirebaseAuthExceptionToString(FirebaseAuthException e) {
    log(e.code);
    final bool arabic = isArabic();
    switch (e.code) {
      case 'weak-password':
        return arabic
            ? 'كلمة المرور ضعيفة جدًا.'
            : 'The password provided is too weak.';
      case 'email-already-in-use':
        return arabic
            ? 'الحساب موجود بالفعل لهذا البريد الإلكتروني.'
            : 'The account already exists for that email.';
      case 'user-not-found':
        return arabic
            ? 'لم يتم العثور على مستخدم لهذا البريد الإلكتروني.'
            : 'No user found for that email.';
      case 'wrong-password':
        return arabic
            ? 'كلمة المرور التي تم إدخالها غير صحيحة.'
            : 'Wrong password provided for that user.';
      default:
        return arabic ? 'حدث خطأ غير معروف.' : ' An unknown error occurred.';
    }
  }
}


// String _mapFirebaseAuthExceptionToString(FirebaseAuthException e) {
//   final bool arabic = isArabic();
//   switch (e.code) {
//     case 'invalid-email':
//       return arabic
//           ? 'البريد الإلكتروني المدخل غير صالح.'
//           : 'The email address is badly formatted.';
//     case 'email-already-in-use':
//       return arabic
//           ? 'الحساب موجود بالفعل لهذا البريد الإلكتروني.'
//           : 'The account already exists for that email.';
//     case 'weak-password':
//       return arabic
//           ? 'كلمة المرور ضعيفة جدًا.'
//           : 'The password provided is too weak.';
//     case 'user-not-found':
//       return arabic
//           ? 'لم يتم العثور على مستخدم لهذا البريد الإلكتروني.'
//           : 'No user found for that email.';
//     case 'wrong-password':
//       return arabic
//           ? 'كلمة المرور التي تم إدخالها غير صحيحة.'
//           : 'Wrong password provided for that user.';
//     case 'user-disabled':
//       return arabic
//           ? 'تم تعطيل الحساب المرتبط بهذا البريد الإلكتروني.'
//           : 'The user account has been disabled by an administrator.';
//     case 'operation-not-allowed':
//       return arabic
//           ? 'نوع المصادقة هذا غير مفعل في إعدادات Firebase.'
//           : 'This sign-in method is not enabled.';
//     case 'invalid-credential':
//       return arabic
//           ? 'بيانات الاعتماد المستخدمة غير صالحة.'
//           : 'The credential provided is invalid.';
//     case 'account-exists-with-different-credential':
//       return arabic
//           ? 'يوجد حساب بالفعل بهذا البريد الإلكتروني باستخدام طريقة تسجيل مختلفة.'
//           : 'An account already exists with the same email but different credentials.';
//     case 'invalid-verification-code':
//       return arabic
//           ? 'رمز التحقق المدخل غير صالح.'
//           : 'The verification code provided is invalid.';
//     case 'invalid-verification-id':
//       return arabic
//           ? 'معرف التحقق المدخل غير صالح.'
//           : 'The verification ID provided is invalid.';
//     case 'quota-exceeded':
//       return arabic
//           ? 'تم تجاوز الحد الأقصى للطلبات.'
//           : 'The SMS quota for this project has been exceeded.';
//     case 'network-request-failed':
//       return arabic
//           ? 'فشل الاتصال بالشبكة.'
//           : 'A network error has occurred.';
//     case 'too-many-requests':
//       return arabic
//           ? 'تم إرسال عدد كبير جدًا من الطلبات في وقت قصير.'
//           : 'Too many requests. Please try again later.';
//     case 'internal-error':
//       return arabic
//           ? 'حدث خطأ داخلي.'
//           : 'An internal error has occurred.';
//     case 'invalid-api-key':
//       return arabic
//           ? 'مفتاح API غير صالح.'
//           : 'The API key provided is invalid.';
//     case 'app-not-authorized':
//       return arabic
//           ? 'التطبيق غير مصرح له باستخدام مشروع Firebase هذا.'
//           : 'This app is not authorized to use Firebase Authentication.';
//     default:
//       return arabic
//           ? 'حدث خطأ غير معروف.'
//           : 'An unknown error occurred.';
//   }
// }
