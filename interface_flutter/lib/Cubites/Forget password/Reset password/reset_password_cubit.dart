import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http ;
import 'package:dubmasterai/Locale stroage/Tokization.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  ResetPassword({required String newpassword})async{
  var  Tokenotp= await CacheNetwork.getFromCache(key:"tokenotp" );
    try{
      emit(ResetpasswordLoadingstate());
     http.Response response =await http.patch(Uri.parse("https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/user/reset-password"),body:

      jsonEncode(

        {
          "newPassword":newpassword,


        }
      ),
        headers: {
        "Content-Type"  : "application/json",
          "token":Tokenotp,



        }

      );
     Map<String,dynamic >Dataresponse=jsonDecode(response.body);

      if(response.statusCode ==200){
        emit(Resetpasswordsecussstate());


      }
      else{

        return Text("${Dataresponse["message"]}");

      }






    }
    catch(e){
      throw Exception("Oops there was an error try later");

    }





  }







}



