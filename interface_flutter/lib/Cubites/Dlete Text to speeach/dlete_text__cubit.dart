import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../Locale stroage/Tokization.dart';
import 'package:dubmasterai/Cubites/Dlete Text to speeach/dlete_text__state.dart';


class DeleteTTSFileCubit extends Cubit<DeleteTTSFileState> {
  DeleteTTSFileCubit() : super(DeleteTTSFileInitial());

  Future<void> deleteTTSFile(String id) async {
    emit(DeleteTTSFileLoading());
    final token = await CacheNetwork.getFromCache(key: "token");

    final response = await http.delete(
      Uri.parse("https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/speech/text-to-speech/$id"),
      headers: {
        "Content-Type": "application/json",
        "token": "$token",
      },
    );

    if (response.statusCode == 200) {
      emit(DeleteTTSFileSuccess());
    } else {
      emit(DeleteTTSFileFailure());
    }
  }
}
