import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_example/core/usecase/errors/failures.dart';
import 'package:tdd_example/core/usecase/usecase.dart';
import 'package:tdd_example/features/domain/entities/space_media_entity.dart';
import 'package:tdd_example/features/domain/repositories/space_media_repository.dart';
import 'package:tdd_example/features/domain/usecases/get_space_media_usecase_from_date.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaUsecaseFromDate usecase;
  late ISpaceMediaRepository repository;


  setUp((){
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaUsecaseFromDate(repository);
  });
  final tDate = DateTime(2022,02,02);
  final tSpaceMedia = SpaceMediaEntity(description: "description", mediaType: "image", title: "title", mediaUrl: 'mediaUrl');
  test('should get space media entity for a given date from the repository', () async {
    // Arrange
    when(() => repository.getSpaceMediaFromDate(any())).thenAnswer((_) async => Right<Failure, SpaceMediaEntity>(tSpaceMedia));
    // Act
    final result = await usecase(tDate);
    // Assert
    expect(result, Right(tSpaceMedia));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });


    test('should return a ServerFailure when don\'t succeed', () async {
    // Arrange
    when(() => repository.getSpaceMediaFromDate(any())).thenAnswer((_) async => Left<Failure, SpaceMediaEntity>(ServerFailure()));
    // Act
    final result = await usecase(tDate);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });
}