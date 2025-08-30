import 'package:dubmasterai/Cubites/Forget%20password/Forget%20password/forget_password__cubit.dart';
import 'package:dubmasterai/Widgets/CustomAppbar.dart';
import 'package:dubmasterai/Widgets/Custome%20Text%20Failed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ForgetPassword extends StatelessWidget {
  final Controlaremail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppbar(title: "Forget Password"),
          SizedBox(height: 180),

          Center(
            child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ForgetPasswordLoadingpasswordstate) {
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
                } else if (state is ForgetPasswordSucessstate) {
                  Navigator.pop(context);
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    title: "We have sent a confirmation code",
                    text: 'Check your email now.',
                    textAlignment: TextAlign.center,
                    confirmBtnText: "OK",
                    onConfirmBtnTap: () {
                      Navigator.pushNamed(context, "OtpScrean");
                    },
                  );
                } else if (state is ForgetPasswordFailer) {
                  Navigator.pop(context);
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    title: "${state.errmasge}",
                    text: '',
                    textAlignment: TextAlign.center,
                    confirmBtnText: "OK",
                    onConfirmBtnTap: () {
                      Navigator.pop(context);
                    },
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Text("Mail Address Here", style: TextStyle(fontSize: 28)),
                    Text(
                      "Enter your new email address ,associated ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "with your account",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 22),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Email", style: TextStyle(fontSize: 18)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomeTextFailed(
              hinttext: "Enter Your Email ",
              icon: Icons.email_outlined,
              lable: "Email",
              conterltext: Controlaremail,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 30),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<ForgetPasswordCubit>(context).AddEmail(
                  Email: Controlaremail.text,
                );
              },
              child: Container(
                height: 43,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "Next",
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
