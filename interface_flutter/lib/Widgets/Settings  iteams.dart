import 'package:dubmasterai/Cubites/dlete/dlete%20Profile%20cubite.dart';
import 'package:dubmasterai/Cubites/dlete/dlete%20profile%20states%20.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Settingsitaems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => Dleteprofilecubite()),


      ],
      child:
      Column(
        children: [


          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),

            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "ProfileSettings");
              },

              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.edit_outlined, color: Colors.blue),
                  title: Text("Edit Profile"),

                  trailing: Icon(Icons.arrow_forward_ios, size: 25),
                ),
              ),
            ),
          ),

          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),

            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "change password");
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.change_circle_outlined,
                    color: Colors.deepPurpleAccent,
                  ),
                  title: Text("Change password"),

                  trailing: Icon(Icons.arrow_forward_ios, size: 25),
                ),
              ),
            ),
          ),

          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),

            child: GestureDetector(
              onTap: () {
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    title: "Are You Sure"""

                    ,
                    text: 'Want to Log out Log out will end current sessin and require yiu to log in again next time .',
                    confirmBtnText: 'Log out',
                    cancelBtnText: 'Cancel',
                    confirmBtnColor: Colors.red,
                    onConfirmBtnTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "welcomeviwe", (route) => false);
                    }
                );
              },
              child: Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.logout_outlined, color: Colors.red),
                  title: Text("Log out", style: TextStyle(color: Colors.red)),

                  trailing: Icon(Icons.arrow_forward_ios, size: 25),

                ),
              ),
            ),
          ),

          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),

            child:
            BlocConsumer<Dleteprofilecubite, Dleteprofilestates>(
              listener: (context, state) {
                if(state is DleteprofilesSucessStates){

                }
                else if (state is DleteprofileLoadingstate){
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
                else if (state is DleteprofileFailerStates){
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
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        title: "Are You Sure"""

                        ,
                        text: 'Deleting Your Account Will permentenly  '""
                            ""
                            "Remove All Data And Cannot Be Undone",
                        confirmBtnText: 'Delete',
                        cancelBtnText: 'Cancel',
                        confirmBtnColor: Colors.red,

                        onConfirmBtnTap: () async {
                          BlocProvider.of<Dleteprofilecubite>(context).dleteprofile();

                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "Userviwe", (route) => false);
                        }
                    );
    
                  },
                  child: Container(
                    child:  ListTile(
                      leading: Icon(Icons.person_off_outlined),
                  title: Text("Delete Profile", style: TextStyle()),

                  trailing: Icon(Icons.arrow_forward_ios, size: 25),
                ),
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),

                  ),
                );
              },
            ),

          ),
        ],
      ),
    );
  }


}