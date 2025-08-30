import 'package:dubmasterai/Cubites/Get%20all%20txet%20to%20speech/Get%20all%20txet%20to%20speech%20Cubite.dart';
import 'package:dubmasterai/Cubites/Get%20all%20video/Get%20all%20video%20cubite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import"package:dubmasterai/pages/Projects page Body.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AudioCubit()),
          BlocProvider(create: (context)=>SubtitledVideoCubit() ),



        ],

        child: ProjectBodypage(),
      ),
    );
   
  }


}