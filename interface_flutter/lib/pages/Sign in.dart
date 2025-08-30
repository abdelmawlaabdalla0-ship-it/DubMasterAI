import 'package:dubmasterai/Cubites/Log%20in/LOgin%20states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dubmasterai/Widgets/password Text Failed.dart';
import 'package:dubmasterai/Widgets/Custome Text Failed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dubmasterai/Cubites/Log in/Login Cubite.dart';
import 'package:loading_indicator/loading_indicator.dart';

class sigin extends StatefulWidget {

  @override
  State<sigin> createState() => _siginState();
}

class _siginState extends State<sigin> {
  GlobalKey<FormState> fromkey = GlobalKey();
  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;
  final Controlaremail = TextEditingController();
  final Controlarpassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: fromkey,
      child:
      BlocProvider(
        create: (context) => Logincubi(),
        child: Scaffold(
          body: ListView(

            children: [

              SizedBox(
                height: 20,
              ),


              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: CustomeTextFailed(
                    conterltext: Controlaremail,
                    hinttext: "Enter Your Email",
                    icon: Icons.email_outlined,
                    lable: "Email"),
              ),

              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Passwordtextfalied(
                  controlar: Controlarpassword,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              BlocConsumer<Logincubi, LoginStates>(
                listener: (context, state) {


    if (state is LoginLogding) {
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

    else if(state is LoginSucessSate){
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
    content: Text(
    "You have successfully logged in",
    style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.green,
    duration: Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(16),
    ),
    );
    Navigator.pushNamed(context, "HOMEPAGE");

    }


    else if( state is Loginfalierstate)
    {
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
                  return GestureDetector(
                    onTap: () {
                      fromkey.currentState!.validate();
                      autovalidatemode = AutovalidateMode.always;
                      setState(() {});
                      BlocProvider.of<Logincubi>(context).Login(Email:Controlaremail.text , Password: Controlarpassword.text);


                    },
                    child: Padding(
                      padding: const EdgeInsets.all(60),
                      child: Container(
                        alignment: Alignment.center,
                        width: 70,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xff616BE6),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: Text("Log in",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "ForgetPassword");
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),


            ],

          ),
        ),
      ),
    );
  }
}