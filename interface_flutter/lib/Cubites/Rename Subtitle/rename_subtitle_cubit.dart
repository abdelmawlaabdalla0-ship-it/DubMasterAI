import 'package:dubmasterai/Locale%20stroage/Tokization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



part 'rename_subtitle_state.dart';

class RenameSubtitleCubit extends Cubit<RenameSubtitleState> {
  RenameSubtitleCubit() : super(RenameSubtitleInitial());

  Future<void> renameSubtitle({required String id, required String newName}) async {
    emit(RenameSubtitleLoading());
    try {
      final token = await CacheNetwork.getFromCache(key: "token");

      final response = await http.patch(
        Uri.parse("https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/subtitle/video-subtitle/$id"),
        headers: {
          "Content-Type": "application/json",
          "token": token,
        },
        body: jsonEncode({"name": newName}),
      );

      if (response.statusCode == 200) {
        emit(RenameSubtitleSuccess());
      } else {
        emit(RenameSubtitleFailure());
      }
    } catch (e) {
      emit(RenameSubtitleFailure());
    }
  }
}
