import 'dart:convert';

import 'package:dubmasterai/Cubites/change%20password/change%20password%20states.dart';
import 'package:dubmasterai/Locale%20stroage/Tokization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class ChangepasswordCubite extends  Cubit<changepasswordstates>{
  ChangepasswordCubite() : super(changepasswordsinitialState());

  Changepassword({required String oldpassword,required String newpassword})async {
    String token = await CacheNetwork.getFromCache(key: "token");

    try {
      emit(changepasswordLoadingState());
      http.Response response = await http.patch(
        Uri.parse(
            "https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/user/change-password"),
        body:jsonEncode({ "oldPassword": oldpassword, "newPassword": newpassword}),
        headers: {
          "token": token,
          "Content-Type":"application/json",




        },

      );
      Map<String, dynamic>ResponseBody = jsonDecode(response.body);
      if (ResponseBody["message"] == "Password updated successfully") {
        emit(changepasswordSucsessStates());
      }
      else {
        emit(changepasswordFailerStates(
            errmassge: "${ResponseBody["message"]}"));
      }
    }
    catch (e) {
      emit(
        changepasswordFailerStates(errmassge: "Something went wrong. Try again later."),
      );
      print("❗ Error: $e");
    }


  }
}