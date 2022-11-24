import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skill_test_trogon_media/core/utils/navigation.dart';
import 'package:skill_test_trogon_media/features/feature1/domain/repositories/shows_repository.dart';
import 'package:skill_test_trogon_media/features/feature1/presentation/pages/casts_page.dart';
import 'package:skill_test_trogon_media/features/feature1/presentation/pages/show_details_page.dart';

import '../../../domain/entities/cast_entity.dart';
import '../../../domain/entities/show_entity.dart';

part 'shows_event.dart';
part 'shows_state.dart';
part 'shows_bloc.freezed.dart';

class ShowsBloc extends Bloc<ShowsEvent, ShowsState> {
  final ShowsRepository repository;
  ShowsBloc(this.repository) : super(ShowsState.initial()) {
    // fetch all shows
    on<_FetchAllShows>((event, emit) async {
      // send loadin state
      emit(state.copyWith(isLoading: true));

      // get all shows
      final songOption = await repository.getAllShows();

      songOption.fold((failure) {
        // send error state
        emit(state.copyWith(
          isLoading: false,
          isError: true,
        ));
      }, (shows) {
        // send success state
        emit(
          state.copyWith(
            isLoading: false,
            shows: shows,
          ),
        );
      });
    });

    // set current show
    on<_ShowDetais>((event, emit) {
      emit(state.copyWith(currentShow: state.shows[event.index]));

      // navigate to show details page
      Navigation.pushNamed(ShowDetailsPage.routeName);
    });

    // fetch casts
    on<_ShowCasts>(
      (event, emit) async {
        // send loading state
        emit(state.copyWith(isLoading: true));

        // get casts
        final castsOption = await repository.getCasts(state.currentShow!.id);
        castsOption.fold(
          (failure) {
            // send error state
            emit(
              state.copyWith(
                isLoading: false,
                isError: true,
              ),
            );
          },
          (casts) {
            log(casts.first.image);
            // send success state
            emit(
              state.copyWith(
                isLoading: false,
                casts: casts,
              ),
            );
          },
        );


        Navigation.pushNamed(CastsPage.routeName);
      },
    );
  }
}
