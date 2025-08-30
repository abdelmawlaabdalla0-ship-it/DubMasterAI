import 'dart:convert';
import 'dart:io';

import 'package:dubmasterai/Cubites/pieck%20Video/pieck%20Video%20Sate.dart';
import 'package:dubmasterai/Locale%20stroage/Tokization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class pieckvideocubite extends Cubit<pieckVideoStates> {
  pieckvideocubite() : super(pieckinitialState());

  XFile? image;

  pickvido() async {
    emit(pieckVideoloading());
    final picker = ImagePicker();
    XFile? video = await picker.pickVideo(source: ImageSource.gallery);
    image = video;
    if (video != null) {
      print("Video Path: ${video.path}");
      emit(pieckVideosuccees());
    } else {
      print("oops there was an error");
      emit(pieckVideofalier());
    }
  }

  Future<void> uplodVideo() async {
    try {
      emit(UplodVideoLoadingState());

      String token = await CacheNetwork.getFromCache(key: "token");

      var uri = Uri.parse(
          "https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/subtitle/video-subtitle");

      var request = http.MultipartRequest("POST", uri);
      request.headers["token"] = token;

      if (image != null) {
        request.files.add(
          await http.MultipartFile.fromPath("file", image!.path),
        );

        var response = await request.send();
        var responseBody = await response.stream.bytesToString();

        print("🔁 Server Response: $responseBody");

        Map<String, dynamic> jsonResponse = jsonDecode(responseBody);

        if (jsonResponse["success"] == true) {
          String url = jsonResponse["videoUrl"];
          emit(UplodVideosucessState(VideoUrl: url));
        } else {
          emit(UplidVideoFalierstate(
              errmasge: "${jsonResponse["error"] ?? "Upload failed"}"));
        }
      } else {
        emit(UplidVideoFalierstate(errmasge: "No video selected."));
      }
    } catch (e) {
      print("❗ Upload error: $e");
      emit(UplidVideoFalierstate(
          errmasge: "Something went wrong. Try again later."));
    }
  }
}
