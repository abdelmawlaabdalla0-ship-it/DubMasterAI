part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetpasswordLoadingstate extends ResetPasswordState{



}

class Resetpasswordsecussstate extends ResetPasswordState{}


class Resetpasswordfalierstate extends ResetPasswordState{
  String errmasge;
  Resetpasswordfalierstate({required this.errmasge});

}
