import 'package:tdd_example/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tdd_example/core/usecase/usecase.dart';
import 'package:tdd_example/features/domain/entities/space_media_entity.dart';
import 'package:tdd_example/features/domain/repositories/space_media_repository.dart';

class GetSpaceMediaUsecaseFromDate implements Usecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaUsecaseFromDate(this.repository);
  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date)async {
    return await repository.getSpaceMediaFromDate(date);
  }

} 