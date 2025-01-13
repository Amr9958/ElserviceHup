import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';

import '../../entities/product_entity.dart';

abstract class profileDataRepo {
  Future<Either<Failure, List<ProfileDataEntity>>> getProfileData();
}
