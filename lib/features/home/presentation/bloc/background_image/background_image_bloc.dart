import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/get_background_image.dart';

part 'background_image_event.dart';

part 'background_image_state.dart';

class BackgroundImageBloc
    extends Bloc<BackgroundImageEvent, BackgroundImageState> {
  final GetBackgroundImageUseCase backgroundImageUseCase;

  BackgroundImageBloc(this.backgroundImageUseCase)
      : super(BackgroundImageInitial()) {
    on<FetchBackgroundImageEvent>((event, emit) async {
      emit(BackgroundImageLoading());
      try {
        final backgroundImage =
            await backgroundImageUseCase.getBackgroundImage(event.locationName);
        emit(BackgroundImageLoaded(backgroundImage: backgroundImage));
      } catch (e) {
        emit(BackgroundImageError(error: e.toString()));
      }
    });
  }
}
