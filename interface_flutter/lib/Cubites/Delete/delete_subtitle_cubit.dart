import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dubmasterai/Locale%20stroage/Tokization.dart';

part 'delete_subtitle_state.dart';

class DeleteSubtitleCubit extends Cubit<DeleteSubtitleState> {
  DeleteSubtitleCubit() : super(DeleteSubtitleInitial());

  Future<void> deleteSubtitle({required String id}) async {
    try {
      emit(DeleteSubtitleLoadingState());
      final token = await CacheNetwork.getFromCache(key: "token");

      final response = await http.delete(
        Uri.parse("https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/subtitle/video-subtitle/$id"),
        headers: {
          "Content-Type": "application/json",
          "token": token ?? "",
        },
      );

      if (response.statusCode == 200) {
        emit(DeleteSubtitleSuccessState());
      } else {
        emit(DeleteSubtitleFailureState());
      }
    } catch (e) {
      emit(DeleteSubtitleFailureState());
    }
  }
}
