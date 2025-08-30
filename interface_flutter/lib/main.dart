
import 'package:dubmasterai/Cubites/Delete/delete_subtitle_cubit.dart';
import 'package:dubmasterai/Cubites/Dlete%20Text%20to%20speeach/dlete_text__cubit.dart';
import 'package:dubmasterai/Cubites/GET%20USER/get%20user%20cubite.dart';
import 'package:dubmasterai/Cubites/Rename%20Subtitle/rename_subtitle_cubit.dart';
import 'package:dubmasterai/Cubites/Rename/rename_cubit.dart';
import 'package:dubmasterai/Cubites/Theam cubite/Theam App States.dart';
import 'package:dubmasterai/Cubites/Theam cubite/Theam Cubite.dart';
import 'package:dubmasterai/Cubites/pieck%20Video/pieck%20Video%20Cubite.dart';
import 'package:dubmasterai/Locale%20stroage/Tokization.dart';
import 'package:dubmasterai/constans.dart';
import 'package:dubmasterai/pages/Changepassword.dart';
import 'package:dubmasterai/pages/Convert%20Page.dart';
import 'package:dubmasterai/pages/FileUbloadedubingpage.dart';
import 'package:dubmasterai/pages/FileUploadpagesubtitle.dart';
import 'package:dubmasterai/pages/FileUploadsubtitle.dart';
import 'package:dubmasterai/pages/Forget%20password%20Page.dart';

import 'package:dubmasterai/pages/Homepage.dart';
import 'package:dubmasterai/pages/Edit Profile Settings.dart';

import 'package:dubmasterai/pages/RestpasswordPage.dart';
import 'package:dubmasterai/pages/Settings.dart';
import 'package:dubmasterai/pages/Sign%20in.dart';
import 'package:dubmasterai/pages/oTP%20Page.dart';
import 'package:dubmasterai/pages/sign%20up.dart';
import 'package:dubmasterai/pages/user%20viwe.dart';
import 'package:dubmasterai/pages/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dubmasterai/pages/Project Page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheNetwork.init();
 token = await CacheNetwork.getFromCache(key: "token");
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => TheamCubite()),
    BlocProvider(create: (context) => GetUserCubit()),
        BlocProvider(create: (context)=>RenameSubtitleCubit() ),
        BlocProvider(create: (context)=>RenameCubit()),
        BlocProvider(create: (context) => DeleteSubtitleCubit()),
        BlocProvider(create: (context) =>DeleteTTSFileCubit() ),


      ],
      child: BlocBuilder<TheamCubite,TheamApp >(
        builder: (context, state) {
          return MaterialApp(
            initialRoute:"welcomeviwe",

            theme: BlocProvider
                .of<TheamCubite>(context)
                .themapp ? ThemeData.light() : ThemeData.dark(),
            debugShowCheckedModeBanner: false,


            routes: {
              "welcomeviwe": (context) => Welcomepage(),
              "Loginvwie": (context) => sigin(),
              "Signupvwie": (context) => Signup(),
              "Userviwe": (context) => userviwe(),
              "HOMEPAGE": (context) => Homepage(),
              "ProfileSettings": (context) =>EditprofileSettings(),
              "ConvertPage": (context) => convertpage(),
              "FileUploadsubtitle": (context) =>FileUploadpagesubtitle() ,
              "file UploadDubinng":(context)=>FileUploadpageDubbing(),
              "Settings": (context)=>Settings(),
              "change password" : (context)=>Changepassword(),
              "OtpScrean": (context)=> Otpapge(),
              "ForgetPassword" : (context)=> Forgetpasswordpage(),
              "Restpassword":(context)=>RestpasswordPage(),
              "Project page" :(context)=>ProjectPage(),
            },
          );
        },
      ),
    );
    throw UnimplementedError();
  }
}




