import 'package:dubmasterai/Cubites/Forget%20password/Verfiy%20_OTP/verfiy__otp_cubit.dart';
import 'package:dubmasterai/pages/Otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Otpapge extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>VerfiyOtpCubit() ,
      child: Scaffold(
        body: OtpScrean(),
      ),
    );
  }

}