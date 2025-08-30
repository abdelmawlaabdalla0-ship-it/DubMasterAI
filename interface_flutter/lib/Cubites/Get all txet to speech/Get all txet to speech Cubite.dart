import 'dart:convert';
import 'package:dubmasterai/Cubites/Get%20all%20txet%20to%20speech/Get%20all%20txet%20to%20speech%20States.dart';
import 'package:dubmasterai/Cubites/Get%20all%20txet%20to%20speech/audio%20Modle.dart';
import 'package:dubmasterai/Locale%20stroage/Tokization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


class AudioCubit extends Cubit<AudioStates> {
  AudioCubit() : super(AudioInitialState());

  Future<void> fetchAudios() async {
    String token = await CacheNetwork.getFromCache(key: "token");
    emit(AudioLoadingState());

    try {
      final response = await http.get(
        Uri.parse('http://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/speech/text-to-speech'),
        headers: {
          "token": token,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List data = jsonData['data'];
        List<AudioModel> audios = data.map((e) => AudioModel.fromJson(e)).toList();
        emit(AudioLoadedState(audios));
      } else {
        emit(AudioErrorState("Failed with status code ${response.statusCode}"));
      }
    } catch (e) {
      emit(AudioErrorState("An error occurred: $e"));
    }
  }


}
