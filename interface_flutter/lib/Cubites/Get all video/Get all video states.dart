import 'package:dubmasterai/Cubites/Get%20all%20video/video%20modle.dart';

abstract class SubtitledVideoState {}

class SubtitledVideoInitial extends SubtitledVideoState {}

class SubtitledVideoLoading extends SubtitledVideoState {}

class SubtitledVideoSuccess extends SubtitledVideoState {
  final List<SubtitledVideoModel> videos;

  SubtitledVideoSuccess(this.videos);
}

class SubtitledVideoError extends SubtitledVideoState {
  final String message;

  SubtitledVideoError(this.message);
}
