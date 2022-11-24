part of 'shows_bloc.dart';

@freezed
class ShowsEvent with _$ShowsEvent {
  const factory ShowsEvent.fetchAllShows() = _FetchAllShows;
  const factory ShowsEvent.getShowDetails() = _GetShowDetails;
  
  const factory ShowsEvent.showDetais(int index) = _ShowDetais;
  const factory ShowsEvent.showCasts(int showId) = _ShowCasts;
  
}