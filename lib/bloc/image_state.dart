import 'package:equatable/equatable.dart';

abstract class ImageState {}

class ImageIsNotLoadState extends ImageState {}

class ImageIsLoadState extends ImageState {}
