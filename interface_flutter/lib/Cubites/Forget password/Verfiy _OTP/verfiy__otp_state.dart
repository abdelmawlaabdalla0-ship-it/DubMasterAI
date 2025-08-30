part of 'verfiy__otp_cubit.dart';


 class VerfiyOtpState {}

class VerfiyOtpInitial extends VerfiyOtpState {}
class VerfiyOtpStateLOadingstate extends VerfiyOtpState{}
class VerfiyOtpStateSucssesstate extends VerfiyOtpState{}
class VerfiyOtpFalierState extends VerfiyOtpState{
  String errmasge;
  VerfiyOtpFalierState({required this.errmasge});

}


