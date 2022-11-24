import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:skill_test_trogon_media/core/error/failures.dart';
import 'package:skill_test_trogon_media/features/feature1/data/models/models.dart';

abstract class ShowsRemoteDataSource {
  Future<List<ShowModel>> getAllShows();
  Future<List<CastModel>> getCasts(int showId);
}

class ShowsRemoteDataSourceImpl implements ShowsRemoteDataSource {
  Dio dio;

  ShowsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ShowModel>> getAllShows() async {
    try {
      final response = await dio.get('https://api.tvmaze.com/shows');

      if (response.statusCode == 200) {
        final List<ShowModel> shows =
            (response.data as List).map((e) => ShowModel.fromMap(e)).toList();
        return shows;
      }
    } on DioError {
      throw ServerFailure();
    }

    throw ClientFailure();
  }

  @override
  Future<List<CastModel>> getCasts(int showId) async {
    try {
      final response =
          await dio.get('https://api.tvmaze.com/shows/$showId/cast');

      if (response.statusCode == 200) {
        final List<CastModel> casts =
            (response.data as List).map((e) => CastModel.fromMap(e)).toList();
        return casts;
      }
    } on DioError {
      throw ServerFailure();
    }

    throw ClientFailure();
  }
}
