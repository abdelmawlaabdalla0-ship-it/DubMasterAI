import 'dart:convert';

import 'package:dubmasterai/Locale%20stroage/Tokization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:dubmasterai/Cubites/Edit profile/Edite profile states.dart';
class EditeProfilecubite extends Cubit<EditeprofileStates>{
  EditeProfilecubite() : super( EditeProfileInitilstate ());
 Future<void> Editeprofile({required String Email,required String username})async{
   String token = await CacheNetwork.getFromCache(key: "token");

   try {
      emit(EditeProfileLoadeingstate());
      http.Response response = await http.patch(
        Uri.parse(
            "https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/user/updateuser"),
        body:jsonEncode({
          "email": Email, "username": username,},),
        headers: {"Content-Type": "application/json",
          "token": token,



        },

      );
  Map<String,dynamic>ResponseBody=jsonDecode(response.body);
      if(ResponseBody["message"] == "User updated successfully"){
        emit(EditeProfilesucsessstate());

      }
      else{
        emit(EditProfilefalierstate(errmassge: ResponseBody["message"]));
      }

    }
    catch (e) {
      emit(
          EditProfilefalierstate(errmassge: "Something went wrong. Try again later.")
      );
      print("❗ Error: $e");
    }





  }





}