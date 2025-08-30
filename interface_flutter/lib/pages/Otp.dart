import 'package:dubmasterai/Cubites/Forget%20password/Verfiy%20_OTP/verfiy__otp_cubit.dart';
import 'package:dubmasterai/Widgets/CustomAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class OtpScrean extends StatefulWidget {
  @override
  State<OtpScrean> createState() => _OtpScreanState();
}

class _OtpScreanState extends State<OtpScrean> {

  late String otb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppbar(title: "Email Verificatin"),
          SizedBox(height: 180),
          BlocConsumer<VerfiyOtpCubit, VerfiyOtpState >(
            listener: (context, state) {
            if(state is VerfiyOtpStateLOadingstate){
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

            else if(state is VerfiyOtpStateSucssesstate){
              Navigator.pop(context);



            }
            else if (state is VerfiyOtpFalierState){
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
              return Center(
                child: Column(
                  children: [
                    Text(
                        "Enter Your Code Here", style: TextStyle(fontSize: 28)),

                    Text(
                      "Enter the 6 digt code that send to your  ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),

                    Text(
                      "Email address.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          Padding(
            child: OtpTextField(

              fieldWidth: 45,
              numberOfFields: 6,
              focusedBorderColor: Colors.green,
              enabledBorderColor: Colors.black,

              borderRadius: BorderRadius.circular(12),
              showCursor: true,
              showFieldAsBox: true,
              borderWidth: 2,
              borderColor: Colors.green,
              obscureText: true,


              onSubmit: (String verificationCode) {
                otb=verificationCode;

              },
            ),

            padding: EdgeInsets.only(top: 34),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 30),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<VerfiyOtpCubit>(context).verfiyOtp(OTP:otb );
                Navigator.pushNamed(context, "Restpassword");
              },
              child: Container(
                height: 43,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "Verify",
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
