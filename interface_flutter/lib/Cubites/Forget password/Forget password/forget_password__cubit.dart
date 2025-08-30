import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dubmasterai/Locale%20stroage/Tokization.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart ' as http;
part 'forget_password__state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  AddEmail({required String Email}) async {
    try {
      emit(ForgetPasswordLoadingpasswordstate());
      http.Response response = await http.post(
        Uri.parse(
          "https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/user/forgot-password",
        ),
        body: jsonEncode({"email": Email}),
        headers: {"Content-Type": "application/json"},
      );
      Map<String, dynamic> Dateresponse = jsonDecode(response.body);

      if (Dateresponse["message"] == "OTP sent successfully") {
        emit(ForgetPasswordSucessstate());

        var TokenoEmail = await CacheNetwork.insertToCache(
          key: "tokenemail",
          value: Dateresponse["token"],
        );
      }
      else{
        emit(ForgetPasswordFailer(
          errmasge: Dateresponse["message"] ?? "Sign up failed.",

        ));


    print("❌ Failed: ${response.statusCode} - ${response.body}");


      }


    }
    catch(e){
      throw Exception("user not found");


    }
  }
}
