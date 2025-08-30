import 'package:dubmasterai/Widgets/CustomAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dubmasterai/Widgets/Settings  iteams.dart';
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppbar(title: "Settings",),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(
                "Account Settings",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Settingsitaems(),

        ],
      ),
    );
  }
}
