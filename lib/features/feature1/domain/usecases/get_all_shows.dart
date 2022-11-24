import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/entities.dart';
import '../repositories/shows_repository.dart';

class GetAllShows extends UseCases<List<ShowEntity>, NoParams> {
  final ShowsRepository repository;

  GetAllShows(this.repository);

  @override
  Future<Either<Failure, List<ShowEntity>>> call(NoParams params) async {
    return await repository.getAllShows();
  }
}