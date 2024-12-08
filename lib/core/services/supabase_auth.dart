// import 'package:supabase_flutter/supabase_flutter.dart';

// import '../constant/constant.dart';
// import '../errors/exception.dart';

// class SupaBaseAuthServices {


//   String _mapSupabaseAuthErrorToString(String errorCode) {
//     final bool arabic = isArabic();

//     switch (errorCode) {
//       case 'anonymous_provider_disabled':
//         return arabic
//             ? 'تم تعطيل تسجيل الدخول كزائر.'
//             : 'Anonymous sign-ins are disabled.';
//       case 'bad_code_verifier':
//         return arabic
//             ? 'رمز التحقق غير صحيح.'
//             : 'The code verifier is incorrect.';
//       case 'bad_json':
//         return arabic
//             ? 'البيانات المدخلة ليست بتنسيق JSON صالح.'
//             : 'The request body is not valid JSON.';
//       case 'bad_jwt':
//         return arabic
//             ? 'رمز التوثيق غير صالح.'
//             : 'The JWT in the Authorization header is invalid.';
//       case 'email_exists':
//         return arabic
//             ? 'البريد الإلكتروني مسجل بالفعل.'
//             : 'The email address already exists.';
//       case 'email_not_confirmed':
//         return arabic
//             ? 'لم يتم تأكيد البريد الإلكتروني بعد.'
//             : 'The email address is not confirmed.';
//       case 'flow_state_expired':
//         return arabic
//             ? 'حالة التدفق قد انتهت، الرجاء تسجيل الدخول مرة أخرى.'
//             : 'The flow state has expired, please sign in again.';
//       case 'identity_already_exists':
//         return arabic
//             ? 'هذه الهوية مرتبطة بالفعل بحساب آخر.'
//             : 'This identity is already linked to another user.';
//       case 'invalid_credentials':
//         return arabic
//             ? 'بيانات الاعتماد غير صحيحة.'
//             : 'Invalid login credentials.';
//       case 'mfa_challenge_expired':
//         return arabic
//             ? 'تحدي التحقق متعدد العوامل قد انتهت صلاحيته.'
//             : 'The multi-factor authentication challenge has expired.';
//       case 'otp_expired':
//         return arabic
//             ? 'رمز OTP قد انتهت صلاحيته.'
//             : 'The OTP code has expired.';
//       case 'session_expired':
//         return arabic ? 'انتهت صلاحية الجلسة.' : 'The session has expired.';
//       case 'signup_disabled':
//         return arabic
//             ? 'تسجيل الحسابات الجديدة تم تعطيله.'
//             : 'Signups are disabled on the server.';
//       case 'user_not_found':
//         return arabic
//             ? 'لم يتم العثور على مستخدم بهذا البريد الإلكتروني.'
//             : 'User not found for this email.';
//       case 'weak-password':
//         return arabic
//             ? 'كلمة المرور ضعيفة جدًا.'
//             : 'The password provided is too weak.';
//       default:
//         return arabic ? 'حدث خطأ غير معروف.' : 'An unknown error occurred.';
//     }
//   }
// }
