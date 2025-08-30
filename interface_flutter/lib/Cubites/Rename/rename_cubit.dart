import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dubmasterai/Locale%20stroage/Tokization.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http ;
part 'rename_state.dart';

class RenameCubit extends Cubit<RenameState> {
  RenameCubit() : super(RenameInitial());

  Rename({required String newname,required String ID})async{

    emit(RenameLoadingstateState());
    try {


      var token = await CacheNetwork.getFromCache(key: "token");

      http.Response response = await http.patch(Uri.parse(
          "https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/speech/text-to-speech/$ID"),

          body: jsonEncode(

              {



                "name": newname
              }


          ),
          headers: {
            "Content-Type": "application/json",
            "token": "${token}",

          }


      );
      Map<String, dynamic>DataResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(RenameSucessState());
      }
      else {
        emit(RenameFalierState());
      }
    }
    catch(e){
      print("Rename subtitle error: $e");
      emit(RenameFalierState());

    }

  }

}
