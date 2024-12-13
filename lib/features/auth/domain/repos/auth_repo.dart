import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);
  Future<Either<Failure, UserEntity>> loginWithGoogle();
  Future<Either<Failure, UserEntity>> loginWithFacebook();
  // Future<Either<Failure, Unit>> logout();
}
