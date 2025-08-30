import 'package:flutter/foundation.dart';
import 'package:dubmasterai/Cubites/GET%20USER/user%20modle.dart';

@immutable
abstract class GetUserState {}

class GetUserInitialState extends GetUserState {}

class GetUserLoadingState extends GetUserState {}

class GetUserSuccessState extends GetUserState {
  final UserModel user;
  GetUserSuccessState(this.user);
}

class GetUserFailureState extends GetUserState {
  final String error;
  GetUserFailureState(this.error);
}
