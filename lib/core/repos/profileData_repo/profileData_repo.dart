import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/entities/ProfileDataEntity.dart';
import 'package:fruits_hub/core/errors/failures.dart';


abstract class profileDataRepo {
  Future<Either<Failure, List<ProfileDataEntity>>> getProfileData();
}
