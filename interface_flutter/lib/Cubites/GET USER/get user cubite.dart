import 'dart:convert';
import 'package:dubmasterai/Cubites/GET%20USER/Get%20user%20state.dart';
import 'package:dubmasterai/Locale%20stroage/Tokization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:dubmasterai/Cubites/GET USER/user modle.dart';


class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(GetUserInitialState());

  Future<UserModel?> getUserData() async {
    String token = await CacheNetwork.getFromCache(key: "token");

    emit(GetUserLoadingState());

    try {
      final response = await http.get(
        Uri.parse(
          "https://dubmasterai-b7a4fhcah7bhe9dm.uaenorth-01.azurewebsites.net/user/getuser",

        ),
        headers:{
          "token" :token,
        }
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final user = UserModel.fromJson(data);
      

        emit(GetUserSuccessState(user));
        return user;
      } else {
        emit(GetUserFailureState("Server error: ${response.statusCode}"));
        return null;
      }
    } catch (e) {
      emit(GetUserFailureState("Exception: $e"));
      return null;
    }
  }
}
