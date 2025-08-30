import 'package:dubmasterai/Widgets/CustomAppbar.dart';
import 'package:dubmasterai/Widgets/password%20Text%20Failed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:dubmasterai/Cubites/change password/change password states.dart';
import 'package:dubmasterai/Cubites/change password/Change password cubit.dart';

class Changepassword extends StatefulWidget {
  @override
  State<Changepassword> createState() => _ChangepasswordState();

}

class _ChangepasswordState extends State<Changepassword> {
  GlobalKey<FormState> formstate = GlobalKey();
  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;
  final Controlarpassword = TextEditingController();
  final Controlarpassword2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formstate,
      child: BlocProvider(
        create: (context) => ChangepasswordCubite(),
        child: Scaffold(
          body: ListView(
            children: [
              CustomAppbar(title: "Change Password"),
              SizedBox(height: 180),
              Center(
                child: Column(
                  children: [
                    Text(
                        "Change Your Password", style: TextStyle(fontSize: 28)),

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

              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 22),
                child: Align(
                  alignment: Alignment.centerLeft,

                  child: Text("Old Password", style: TextStyle(fontSize: 18)),
                ),
              ),
              SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Passwordtextfalied(
                  controlar: Controlarpassword,

                ),
              ),

              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 22),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("New Password", style: TextStyle(fontSize: 18)),
                ),
              ),

              SizedBox(height: 8),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Passwordtextfalied(
                  controlar: Controlarpassword2,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 28, horizontal: 30),
                child: BlocConsumer<ChangepasswordCubite, changepasswordstates>(
                  listener: (context, state) {
                   if(state is changepasswordSucsessStates){
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
                               "welcomeviwe", (route) => false);
                         }


                     );


                   }
                   else if (state is changepasswordFailerStates){
                     QuickAlert.show(

                         context: context,

                         type: QuickAlertType.error,
                         title: "Secure Your Account",
                         text: '${state.errmassge}'
                            ,
                         textAlignment: TextAlign.center,
                         confirmBtnText: "OK",

                         onConfirmBtnTap: () {
                           Navigator.of(context).pushNamedAndRemoveUntil(
                               "welcomeviwe", (route) => false);
                         }


                     );


                   }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {

                        formstate.currentState!.validate();
                        autovalidatemode = AutovalidateMode.always;
                       BlocProvider.of<ChangepasswordCubite>(context).Changepassword(oldpassword:Controlarpassword.text , newpassword: Controlarpassword2.text);

                        setState(() {});
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
