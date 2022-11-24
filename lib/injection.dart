// dependency injection

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:skill_test_trogon_media/features/feature1/domain/repositories/shows_repository.dart';

import 'features/feature1/data/datasources/shows_remote_datasource.dart';
import 'features/feature1/data/repositories/shows_repository_impl.dart';
import 'features/feature1/presentation/bloc/bloc/shows_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> setupInjection() async {
  // blocs
  sl.registerFactory(() => ShowsBloc(sl()));

  // repositories
  sl.registerLazySingleton<ShowsRepository>(() => ShowsRepositoryImpl(sl()));

  // data sources
  sl.registerLazySingleton<ShowsRemoteDataSource>(
      () => ShowsRemoteDataSourceImpl(sl()));

      // external
  sl.registerLazySingleton(() => Dio());

}