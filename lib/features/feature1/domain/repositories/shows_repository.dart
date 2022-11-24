import 'package:dartz/dartz.dart';
import 'package:skill_test_trogon_media/core/error/failures.dart';
import 'package:skill_test_trogon_media/features/feature1/domain/entities/entities.dart';

abstract class ShowsRepository {
  Future<Either<Failure, List<ShowEntity>>> getAllShows();
  Future<Either<Failure, List<CastEnitity>>> getCasts(int showId);
}