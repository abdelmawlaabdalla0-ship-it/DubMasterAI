import 'package:dubmasterai/Cubites/GET%20USER/Get%20user%20state.dart';
import 'package:dubmasterai/Cubites/GET%20USER/get%20user%20cubite.dart';
import 'package:dubmasterai/Cubites/Theam cubite/Theam Cubite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class drawer extends StatefulWidget {
  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {


  @override
  Widget build(BuildContext context) {
    return ListView(

      children: [
        BlocBuilder<GetUserCubit, GetUserState>(
          builder: (context, state) {
            if (state is GetUserSuccessState) {
              return UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xff006d77)),
                accountName: Text("${state.user.username}"),
                accountEmail: Text("${state.user.email}"),
              );
            } else if (state is GetUserLoadingState) {
              return UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xff006d77)),
                accountName: Text("Loading..."),
                accountEmail: Text("Please wait"),
              );
            } else {
              return UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color(0xff006d77)),
                accountName: Text("Guest User"),
                accountEmail: Text("guest@example.com"),
              );
            }
          },
        ),
        ListTile(
          leading: IconButton(onPressed: () {
            BlocProvider.of<TheamCubite>(context).swtichtheam();
          }, icon: Icon(BlocProvider
              .of<TheamCubite>(context)
              .themapp ? Icons.sunny : Icons.dark_mode_outlined),),
        ),


        ListTile(
          onTap: () {
            Navigator.pushNamed(context, "HOMEPAGE");
          },
          leading: Icon(Icons.home),
          title: Text("Home page "),
        ),

        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed("ConvertPage");
          },
          leading: Icon(Icons.multitrack_audio_rounded),
          title:
          Text("Text to speech",
            style: TextStyle(

            ),),


        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed(
                "Settings",);
          },
          leading: Icon(Icons.settings),
          title: Text("profile Settings"),
        ),



        Align(
          alignment: Alignment.bottomLeft,
          child:ListTile(
            onTap: () {
              Navigator.pushNamed(context, "Userviwe");
            },
            leading: Icon(Icons.logout_rounded,
              color: Colors.red,
            ),
            title: Text("Log Out"),
          ),
        ),



      ],
    );
  }
}
