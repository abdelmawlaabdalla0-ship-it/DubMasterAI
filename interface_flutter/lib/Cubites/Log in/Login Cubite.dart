import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dubmasterai/Cubites/Log in/LOgin states.dart';
import 'package:http/http.dart' as http;
import 'package:dubmasterai/Locale stroage/Tokization.dart';

class Logincubi extends Cubit<LoginStates> {
  Logincubi() : super(LogininitialState());

  Login({required String Email, required String Password}) async {
    try {
      emit(LoginLogding());

      http.Response response = await http.post(
        Uri.parse("https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/user/login"),
        body:jsonEncode( {"email": Email, "password": Password}),
        headers: {"Content-Type": "application/json"},
      );

      Map<String, dynamic> ResponseBody = jsonDecode(response.body);
      await CacheNetwork.insertToCache(
        key: "token",
        value: ResponseBody["token"],
      );

      if (ResponseBody["message"] == "Login successful") {
        emit(LoginSucessSate());
        print(ResponseBody["message"]);
      } else {
        emit(Loginfalierstate(
          errmassge: ResponseBody["message"] ?? "Sign up failed.",
        ));
        print("❌ Failed: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      emit(
        Loginfalierstate(errmassge: "Something went wrong. Try again later."),
      );
      print("❗ Error: $e");
    }
  }
}
