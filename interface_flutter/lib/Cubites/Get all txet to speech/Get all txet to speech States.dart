
import 'package:dubmasterai/Cubites/Get%20all%20txet%20to%20speech/audio%20Modle.dart';

abstract class AudioStates {}

class AudioInitialState extends AudioStates {}

class AudioLoadingState extends AudioStates {}

class AudioLoadedState extends AudioStates {
  final List<AudioModel> audioList;

  AudioLoadedState(this.audioList);
}

class AudioErrorState extends AudioStates {
  final String error;

  AudioErrorState(this.error);
}