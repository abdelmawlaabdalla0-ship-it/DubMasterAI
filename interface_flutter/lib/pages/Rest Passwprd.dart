import 'package:dubmasterai/Cubites/Forget%20password/Reset%20password/reset_password_cubit.dart';
import 'package:dubmasterai/Widgets/CustomAppbar.dart';

import 'package:dubmasterai/Widgets/password Text Failed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Restpassword extends StatefulWidget {
  @override
  State<Restpassword> createState() => _RestpasswordState();
}

class _RestpasswordState extends State<Restpassword> {
  final Controlarpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppbar(title: "Change Password"),
          SizedBox(height: 180),
          BlocListener<ResetPasswordCubit, ResetPasswordState>(
            listener: (context, state) {
              if(state is ResetpasswordLoadingstate){
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: LoadingIndicator(
                        indicatorType: Indicator.lineScale,
                        colors: const [Colors.lightBlue],
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                );



              }
              else if (state is Resetpasswordsecussstate){
                Navigator.pop(context);
                QuickAlert.show(

                    context: context,

                    type: QuickAlertType.success,
                    title: "Secure Your Account",
                    text: 'Upadate your password to keep your account'
                        ''
                        'safe and protect your personal information .',
                    textAlignment: TextAlign.center,
                    confirmBtnText: "OK",
                    onConfirmBtnTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "Userviwe", (route) => false);
                    }
                );



              }

              else if(state is   Resetpasswordfalierstate){
                Navigator.pop(context);
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  title: "${state.errmasge}",
                  text: '',
                  textAlignment: TextAlign.center,
                  confirmBtnText: "OK",
                  onConfirmBtnTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "Userviwe", (route) => false);
                  },
                );




              }
            },
            child: Center(
              child: Column(
                children: [
                  Text("Change Your Password", style: TextStyle(fontSize: 28)),

                  Text(
                    "Enter your new password here ,and ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),

                  Text(
                    "make it differnt from previous",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 22),
            child: Align(
              alignment: Alignment.centerLeft,

              child: Text("Password", style: TextStyle(fontSize: 18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Passwordtextfalied(
              controlar: Controlarpassword,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 30),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<ResetPasswordCubit>(context).ResetPassword(newpassword:Controlarpassword.text );

                setState(() {

                });
              },
              child: Container(
                height: 43,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "Reset",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
