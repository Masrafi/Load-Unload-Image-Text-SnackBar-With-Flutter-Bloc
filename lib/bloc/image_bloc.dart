import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:load_image_text/bloc/image_event.dart';
import 'package:load_image_text/bloc/image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageIsNotLoadState()) {
    on<ImageIsNotLodedEvent>((event, emit) {
      emit(ImageIsNotLoadState());
    });

    on<ImageIsLodedEvent>((event, emit) {
      emit(ImageIsLoadState());
    });
  }
}
