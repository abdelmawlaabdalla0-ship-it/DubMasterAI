import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dubmasterai/Locale%20stroage/Tokization.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http ;
import 'package:dubmasterai/Locale stroage/Tokization.dart';

part 'verfiy__otp_state.dart';

class VerfiyOtpCubit extends Cubit<VerfiyOtpState> {
  VerfiyOtpCubit() : super(VerfiyOtpInitial());

  verfiyOtp({required String OTP})async{
try {
  emit(VerfiyOtpStateLOadingstate());
  String token = await CacheNetwork.getFromCache(key: "tokenemail");

http.Response response  = await http.post(Uri.parse(
      "https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/user/verify-otp"),
      body: jsonEncode(
          {
            "otp": OTP,

          }
      ),
      headers: {
        "Content-Type": "application/json",
        "token": token,
      }


  );
  Map<String,dynamic>DataResponse=jsonDecode(response.body);
  if(DataResponse["message"]=="OTP verified successfully"){

   var tokenotp= await  CacheNetwork.insertToCache(key: "tokenotp", value:DataResponse[ "resetToken"]);
emit(VerfiyOtpStateSucssesstate());


  }
  else{
    emit(VerfiyOtpFalierState(
      errmasge:DataResponse["message"] ?? " failed.",

    ));



  }




}
catch(e){
  throw Exception("Oops thers was an error try later");
}

  }




}
