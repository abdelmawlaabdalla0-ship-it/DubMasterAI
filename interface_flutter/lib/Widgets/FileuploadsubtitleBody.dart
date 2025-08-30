import 'package:dubmasterai/Cubites/pieck%20Video/pieck%20Video%20Cubite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FileuploadsubtitleBody extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_upload, size: 40),
          Text("Drop files here"),
          Text('Supported format: PNG, JPG'),
          SizedBox(height: 20),
          Text(
            "OR",
            style: TextStyle(
              fontSize: 30,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w400,
            ),
          ),

          TextButton(
            onPressed: () {

          BlocProvider.of<pieckvideocubite>(context).pickvido();


            },

            child: Text(
              "Browse files",
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}