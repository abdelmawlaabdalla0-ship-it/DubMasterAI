import 'package:dubmasterai/Cubites/pieck%20Video/pieck%20Video%20Cubite.dart';
import 'package:dubmasterai/pages/FileUploadsubtitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileUploadpagesubtitle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => pieckvideocubite(),
      child: Scaffold(
        body: FileUploadsubtitle(),
      ),
    );


  }
}