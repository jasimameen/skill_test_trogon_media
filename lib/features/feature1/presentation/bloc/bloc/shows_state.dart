part of 'shows_bloc.dart';

@freezed
class ShowsState with _$ShowsState {
  const factory ShowsState({
    required List<ShowEntity> shows,
    required List<CastEnitity> casts,
    required ShowEntity? currentShow,
    required bool isLoading,
    required bool isError,
  }) = _ShowStruct;

   factory ShowsState.initial() => ShowsState(
        shows: [],
        casts: [],
        currentShow: null,
        isLoading: false,
        isError: false,
      );
  
}
