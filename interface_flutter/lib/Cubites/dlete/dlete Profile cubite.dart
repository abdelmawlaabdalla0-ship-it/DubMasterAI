import 'dart:convert';

import 'package:dubmasterai/Cubites/dlete/dlete%20profile%20states%20.dart';
import 'package:dubmasterai/Locale%20stroage/Tokization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class Dleteprofilecubite extends Cubit<Dleteprofilestates>{


  Dleteprofilecubite() : super(Dleteprofileinitlstate() );

  Future<void>dleteprofile()async{
    String token = await CacheNetwork.getFromCache(key: "token");
    emit(Dleteprofilestates());
http.Response response =await http.delete(Uri.parse("https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/user/deleteuser"),

  headers: {
  "token":token,
  }

);
Map<String,dynamic>ResponseBODY=jsonDecode(response.body);
if(ResponseBODY["message"]=="User deleted successfully"){
  emit(DleteprofilesSucessStates());

}
else{
  emit(DleteprofileFailerStates(errmassge: ResponseBODY["message"]));
}




  }

}