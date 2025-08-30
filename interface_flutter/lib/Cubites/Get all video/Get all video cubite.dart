import 'dart:convert';
import 'package:dubmasterai/Cubites/Get%20all%20video/Get%20all%20video%20states.dart';
import 'package:dubmasterai/Cubites/Get%20all%20video/video%20modle.dart';
import 'package:dubmasterai/Locale%20stroage/Tokization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


class SubtitledVideoCubit extends Cubit<SubtitledVideoState> {
  SubtitledVideoCubit() : super(SubtitledVideoInitial());

  Future<void> fetchSubtitledVideos() async {
    String token = await CacheNetwork.getFromCache(key: "token");
    emit(SubtitledVideoLoading());
    try {
      final response = await http.get(
        Uri.parse('https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/subtitle/video-subtitle'),
        headers: {
          "token": token,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List data = jsonData['data'];
        final videos = data.map((e) => SubtitledVideoModel.fromJson(e)).toList();
        emit(SubtitledVideoSuccess(videos));
      } else {
        emit(SubtitledVideoError('Failed to fetch videos: ${response.statusCode}'));
      }
    } catch (e) {
      emit(SubtitledVideoError('An error occurred: $e'));
    }
  }
}
