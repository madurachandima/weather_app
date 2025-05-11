part of 'background_image_bloc.dart';

@immutable
sealed class BackgroundImageState {}

final class BackgroundImageInitial extends BackgroundImageState {}

class BackgroundImageLoading extends BackgroundImageState{
  BackgroundImageLoading();
}

class BackgroundImageLoaded extends BackgroundImageState{
  final String backgroundImage;
  BackgroundImageLoaded({required this.backgroundImage});
}

class BackgroundImageError extends BackgroundImageState{
  final String error;
  BackgroundImageError({required this.error});
}