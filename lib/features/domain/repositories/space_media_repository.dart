import 'package:dartz/dartz.dart';
import 'package:tdd_example/core/usecase/errors/failures.dart';
import 'package:tdd_example/features/domain/entities/space_media_entity.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date);
}