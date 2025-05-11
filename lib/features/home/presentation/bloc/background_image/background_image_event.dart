part of 'background_image_bloc.dart';

@immutable
sealed class BackgroundImageEvent {}

class FetchBackgroundImageEvent extends BackgroundImageEvent {
  final String locationName;
  FetchBackgroundImageEvent(this.locationName);
}
