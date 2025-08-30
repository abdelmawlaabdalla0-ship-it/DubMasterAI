part of 'forget_password__cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoadingpasswordstate extends ForgetPasswordState{}

class ForgetPasswordSucessstate extends ForgetPasswordState{}

class ForgetPasswordFailer extends ForgetPasswordState{
  String errmasge;
  ForgetPasswordFailer({required this.errmasge});

}