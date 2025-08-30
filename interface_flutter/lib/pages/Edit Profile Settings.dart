import 'package:dubmasterai/Widgets/Custome%20Text%20Failed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:dubmasterai/Widgets/CustomAppbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:dubmasterai/Cubites/Edit profile/Edite profile states.dart';
import 'package:dubmasterai/Cubites/Edit profile/Edite profile cubit.dart';

class EditprofileSettings extends StatefulWidget {
  @override
  State<EditprofileSettings> createState() => _profileSettingsState();
}

class _profileSettingsState extends State<EditprofileSettings> {
  final Controlaremail = TextEditingController();
  final Controlarusername = TextEditingController();

  GlobalKey<FormState>formstate = GlobalKey();
  AutovalidateMode autovalidatemode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formstate,
      child:



      BlocProvider(
        create: (context) => EditeProfilecubite(),
        child: Scaffold(

          body: Expanded(child:
          ListView(
            children: [
              CustomAppbar(title: "Profile Sttings"),

              SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 2,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 6,

                  child: Flexible(
                    child:

                    FittedBox(


                      fit: BoxFit.scaleDown,
                      child: Image.asset("assets/mic logo.png",

                      ),
                    ),
                  ),
                ),

              ),
              SizedBox(
                height: 70,
              ),

              SizedBox(
                height: 20,
              ),


              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: CustomeTextFailed(
                  conterltext: Controlarusername,
                  hinttext: "Enter User Name",
                  icon: Icons.person_outline,
                  lable: "User Name",
                ),
              ),
              SizedBox(
                height: 50,
              ),
              BlocConsumer<EditeProfilecubite, EditeprofileStates>(
                listener: (context, state) {
                 if(state is EditeProfileLoadeingstate){
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
                 else if (state is EditeProfilesucsessstate){
                   Navigator.pop(context);
                   QuickAlert.show(


                       context: context,

                       type: QuickAlertType.success,
                       title: "Profile Updated Successfully",
                       text: "Your changes have been saved to your account",


                       textAlignment: TextAlign.center,
                       confirmBtnText: "OK",

                       onConfirmBtnTap: () {
                         Navigator.pop(context);
                       }



                   );

                 }
                },
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<EditeProfilecubite>(context).Editeprofile(Email:Controlaremail.text , username: Controlarusername.text);
                      formstate.currentState!.validate();
                      autovalidatemode = AutovalidateMode.always;
                    setState(() {
                      
                    });

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(60),
                      child: Container(
                        alignment: Alignment.center,
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xff616BE6),
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: Text("Save ",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),


            ],

          ),


          ),


        ),
      ),
    );


  }
}