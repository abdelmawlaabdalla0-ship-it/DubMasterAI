import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'Text to Speech states.dart';
import 'package:dubmasterai/Locale stroage/Tokization.dart';

class TexttoSpeech extends Cubit<TexttoSpeechStats> {
  TexttoSpeech() : super(TexttoSpeechitialState());

  Future<void> sendiduo({required String Speech, required String language}) async {
    emit(TexttoSpeechlOadingState());
    try {
      String token = await CacheNetwork.getFromCache(key: "token");
      http.Response response = await http.post(
        Uri.parse("https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/speech/text-to-speech"),
        body: jsonEncode({"text": Speech, "language": language}),
        headers: {
          "Content-Type": "application/json",
          "token": token,
        },
      );

      Map<String, dynamic> ResponseBody = jsonDecode(response.body);

      if (ResponseBody["success"] == true) {
        String audio = ResponseBody["audioUrl"];
        emit(TexttoSpeechSucessState(audioUrl: audio));
      } else {
        emit(TexttoSpeechfalierState(errmassge: "Something went wrong. Try again later"));
      }
    } catch (e) {
      emit(TexttoSpeechfalierState(errmassge: "Something went wrong. Try again later."));
      print("❗ Error: $e");
    }
    print("Sending text: $Speech");
    print("Language code: $language");

  }
}
