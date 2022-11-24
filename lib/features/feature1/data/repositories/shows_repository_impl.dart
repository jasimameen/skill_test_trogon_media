// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:skill_test_trogon_media/core/error/failures.dart';
import 'package:skill_test_trogon_media/features/feature1/data/datasources/shows_remote_datasource.dart';
import 'package:skill_test_trogon_media/features/feature1/domain/entities/cast_entity.dart';
import 'package:skill_test_trogon_media/features/feature1/domain/entities/show_entity.dart';
import 'package:skill_test_trogon_media/features/feature1/domain/repositories/shows_repository.dart';

class ShowsRepositoryImpl implements ShowsRepository {
  ShowsRemoteDataSource dataSource;
  ShowsRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<ShowEntity>>> getAllShows() async {
    try {
      final shows = await dataSource.getAllShows();

      return right(shows);
    } on DioError {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CastEnitity>>> getCasts(int showId) async{
    try {
      final casts = await dataSource.getCasts(showId);

      return right(casts);
    } on DioError {
      return Left(ServerFailure());
    }
  }
}
