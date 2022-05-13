import 'package:tdd_example/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tdd_example/core/usecase/usecase.dart';
import 'package:tdd_example/features/domain/entities/space_media_entity.dart';

class GetSpaceMediaUsecase implements Usecase<SpaceMediaEntity, NoParams> {
  @override
  Future<Either<Failure, SpaceMediaEntity>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

} 