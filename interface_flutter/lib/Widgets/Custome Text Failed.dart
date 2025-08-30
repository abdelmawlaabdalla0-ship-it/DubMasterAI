import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeTextFailed extends StatefulWidget {
  final String hinttext;
  final String lable;
  final IconData icon;
  final conterltext;



   CustomeTextFailed(
      {required this.hinttext, required this.icon, required this.lable,required this.conterltext});

  @override
  State<CustomeTextFailed> createState() => _CustomeTextFailedState();
}

class _CustomeTextFailedState extends State<CustomeTextFailed> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
controller:widget.conterltext ,

      validator: (valu) {
        if (valu?.isEmpty ?? true) {
          return ("Failed is required");
        } else {
          return null;
        }
      },


      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),


        ),


        focusedBorder:Bulidborder(Colors.green),
        errorBorder: Bulidborder(Colors.red),
        enabledBorder: Bulidborder(Colors.blueAccent),


        hintText: widget.hinttext,
        hintStyle: TextStyle(
          fontSize: 17,
        ),
        labelText: widget.lable,
        labelStyle: TextStyle(
          fontSize: 17,

        ),
        suffixIcon: Icon(widget.icon,
          size: 20,
        ),

      ),


    );

  }

  OutlineInputBorder    Bulidborder ([color]){
   return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),


      borderSide: BorderSide(

        color:color ,


      ),


    );

  }



}