part of 'rename_subtitle_cubit.dart';

@immutable
abstract class RenameSubtitleState {}

class RenameSubtitleInitial extends RenameSubtitleState {}

class RenameSubtitleLoading extends RenameSubtitleState {}

class RenameSubtitleSuccess extends RenameSubtitleState {}

class RenameSubtitleFailure extends RenameSubtitleState {}
