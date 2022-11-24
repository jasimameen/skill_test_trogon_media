import 'package:skill_test_trogon_media/features/feature1/domain/entities/show_entity.dart';
import 'package:skill_test_trogon_media/features/feature1/domain/entities/cast_entity.dart';
import 'package:skill_test_trogon_media/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:skill_test_trogon_media/features/feature1/domain/repositories/shows_repository.dart';

class ShowsRepositoryImpl implements ShowsRepository {
  @override
  Future<Either<Failure, List<ShowEntity>>> getAllShows() {
    // TODO: implement getAllShows
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CastEnitity>>> getCasts(int showId) {
    // TODO: implement getCasts
    throw UnimplementedError();
  }
}