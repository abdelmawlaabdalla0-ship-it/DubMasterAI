part of 'delete_subtitle_cubit.dart';

@immutable
abstract class DeleteSubtitleState {}

class DeleteSubtitleInitial extends DeleteSubtitleState {}

class DeleteSubtitleLoadingState extends DeleteSubtitleState {}

class DeleteSubtitleSuccessState extends DeleteSubtitleState {}

class DeleteSubtitleFailureState extends DeleteSubtitleState {}
