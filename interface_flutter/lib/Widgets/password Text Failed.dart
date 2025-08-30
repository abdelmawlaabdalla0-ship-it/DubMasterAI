import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Passwordtextfalied extends StatefulWidget {
  @override
  final controlar;
  Passwordtextfalied({required this.controlar});

  State<Passwordtextfalied> createState() => _PasswordtextfaliedState();
}

class _PasswordtextfaliedState extends State<Passwordtextfalied> {

  bool obscuretext = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controlar,
      validator: (valu) {
        if (valu?.isEmpty ?? true) {
          return ("Failed is required");
        } else {
          return null;
        }
      },
      obscureText: obscuretext,

      decoration: InputDecoration(

        border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(16)),

        focusedBorder: bulidborder(Colors.green),
        errorBorder: bulidborder(Colors.red),
        enabledBorder: bulidborder(Colors.blueAccent),

        hintText: "Enter Your password",
        hintStyle: TextStyle(fontSize: 17),
        labelText: "password",
        labelStyle: TextStyle(fontSize: 17),

        suffixIcon: IconButton(
          onPressed: () {
            obscuretext = !obscuretext;

            setState(() {});
          },

          icon: Icon(
            obscuretext ? Icons.visibility_off : Icons.visibility,
            size: 20,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder bulidborder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),

      borderSide: BorderSide(color: color),
    );
  }
}
