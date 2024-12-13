import 'package:dartz/dartz.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../../../core/services/supabase_auth_services.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../model/user_model.dart';

class AuthRepoIpm implements AuthRepo {

  final SupabaseAuthServices supaBaseAuthServices;

  AuthRepoIpm( {required this.supaBaseAuthServices});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final users = await supaBaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromSupabase(users ));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final user = await supaBaseAuthServices.loginWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromSupabase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final user = await supaBaseAuthServices.loginWithGoogle();
      return right(UserModel.fromSupabase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    try {
      final user = await supaBaseAuthServices.signInWithFacebook();
      return right(UserModel.fromSupabase(user!));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}

