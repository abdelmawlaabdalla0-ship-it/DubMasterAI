import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dubmasterai/Cubites/Sign up/Sign up state.dart';

class Signupcubite extends Cubit<SiginupStates> {
  Signupcubite() : super(SignupinitialState());

  Future<void> SignUP({
    required String Username,
    required String Email,
    required String Passsword,
  }) async {
    emit(SiginupLogding());

    try {
      final response = await http.post(
        Uri.parse("https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/user/signup"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "username": Username,
          "email": Email,
          "password": Passsword,
        }),
      );

      final ResponseBody = jsonDecode(response.body);

      if (ResponseBody["message"]=="User created, please check your email for verification") {
        emit(SiginupVeeyfaiyEmail(
          viryfaiymassage: ("${ResponseBody["message"]}"),

        ),

        );
        print(" ${response.body}");
      }
      else {
        emit(Siginupfalierstate(
          errmassge: ResponseBody["message"] ?? "Sign up failed.",
        ));
        print("❌ Failed: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      emit(Siginupfalierstate(
        errmassge: "Something went wrong. Try again later.",
      ));
      print("❗ Error: $e");
    }
  }
}
