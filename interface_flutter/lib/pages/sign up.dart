import 'package:dubmasterai/Widgets/Custome%20Text%20Failed.dart';
import 'package:dubmasterai/Widgets/password%20Text%20Failed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dubmasterai/Cubites/Sign up/Sign up cubit.dart';
import 'package:dubmasterai/Cubites/Sign up/Sign up state.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> fromkey = GlobalKey();
  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;
  final Controlaremail = TextEditingController();
  final Controlarusername = TextEditingController();
  final Controlarpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromkey,

      child: BlocConsumer<Signupcubite,SiginupStates >(
        listener: (context, state) {
          if (state is SiginupLogding) {
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

          else if (state is SiginupVeeyfaiyEmail) {
            Navigator.pop(context);
            QuickAlert.show(

                context: context,

                type: QuickAlertType.success,
                title: "Sign Up Successfully",
                text: 'place chack your email '
                    ''
                    'to Verify DubMaster Ai Email✔ .',
                textAlignment: TextAlign.center,
                confirmBtnText:"OK",
                onConfirmBtnTap: (){
                  Navigator.of(context).pushNamedAndRemoveUntil("welcomeviwe", (route) => false);



                }
            );


          }

          else if (state is Siginupfalierstate) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errmassge,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(16),
              ),
            );
          }
        },
        builder: (context, state) {
        return  Scaffold(
            body: ListView(
              children: [
                SizedBox(height: 20),

                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: CustomeTextFailed(
                    conterltext: Controlaremail,
                    hinttext: "Enter Your Email",
                    icon: Icons.email_outlined,
                    lable: "Email",
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Passwordtextfalied(controlar: Controlarpassword),
                ),

                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: CustomeTextFailed(
                    conterltext: Controlarusername,
                    hinttext: "Enter User Name",
                    icon: Icons.person_outline,
                    lable: "User Name",
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(60),
                  child: GestureDetector(
                    onTap: () {
                      fromkey.currentState!.validate();
                      autovalidatemode = AutovalidateMode.always;
                      setState(() {});
                      BlocProvider.of<Signupcubite>(context).SignUP(
                        Username: Controlarusername.text,
                        Email: Controlaremail.text,
                        Passsword: Controlarpassword.text,
                      );

                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 400,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xff616BE6),
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),

        );
        },
      ),


    );
  }
}
