import 'package:dubmasterai/Cubites/GET%20USER/Get%20user%20state.dart';
import 'package:dubmasterai/Widgets/Drawer.dart';
import 'package:dubmasterai/Widgets/robotimage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dubmasterai/Cubites/GET USER/get user cubite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void initState() {
    BlocProvider.of<GetUserCubit>(context).getUserData();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
return Scaffold(




        appBar: AppBar(

          backgroundColor: Colors.transparent,
          title: BlocConsumer<GetUserCubit, GetUserState>(
            listener: (context, state) {
              if (state is GetUserFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("User could not be loaded : ${state.error}"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is GetUserLoadingState) {
                return Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 10),
                    Text(
                      "Loading user data...",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                );
              } else if (state is GetUserSuccessState) {
                return Text(
                  " Welcome ً${state.user.username} 👋",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                );
              } else if (state is GetUserFailureState) {
                return Text(
                  "User could not be loaded.",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                );
              } else {
                return Text(
                  "Welcome ..... 👋",
                  style: TextStyle(fontSize: 20),
                );
              }
            },
          )

        ),
        drawer: Drawer(child: drawer()),
        body: Column(
          children: [
            SizedBox(height: 100),
            Center(child: robaotimage()),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.only(right: 220),
              child: Text(
                "Services",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,

                ),
              ),
            ),
            SizedBox(height: 25),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: []),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,"file UploadDubinng");
                  },
                  child: Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xffDAE0F6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(size: 35, Icons.downloading_outlined),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Video Dubbing",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "ConvertPage");
                  },
                  child: Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xfff3c4fb),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(size: 35, Icons.mic),


                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Text To Speech",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "FileUploadsubtitle");
                  },
                  child: Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xffb3dee2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [

                        Icon(size: 35, Icons.video_camera_back_outlined),

                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Video Subtitle",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "Project page");
                  },
                  child: Container(
                    height: 120,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xffFFC8DD),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(size: 35, Icons.folder_copy_outlined),

                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text("Projects", style: TextStyle(
                              fontSize: 20)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

    );

  }
}
