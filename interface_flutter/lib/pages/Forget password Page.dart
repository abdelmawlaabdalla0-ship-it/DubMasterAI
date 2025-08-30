import 'package:dubmasterai/Cubites/Forget%20password/Forget%20password/forget_password__cubit.dart';
import 'package:dubmasterai/pages/Forget%20Password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Forgetpasswordpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>ForgetPasswordCubit(),
      child: Scaffold(
        body: ForgetPassword(),
      ),
    );
  }

}