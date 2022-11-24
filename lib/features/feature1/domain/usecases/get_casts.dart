import 'package:skill_test_trogon_media/core/usecases/usecases.dart';
import 'package:skill_test_trogon_media/features/feature1/domain/repositories/shows_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/entities.dart';

class GetCasts extends UseCases<List<CastEnitity>, Params> {
  final ShowsRepository repository;

  GetCasts(this.repository);

  @override
  Future<Either<Failure, List<CastEnitity>>> call(Params params) async {
    return await repository.getCasts(params.showId);
  }
}

/// pass the showId to the usecase
class Params {
  final int showId;

  Params({required this.showId});
}
