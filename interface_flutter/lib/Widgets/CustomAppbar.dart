import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  CustomAppbar({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 34, left: 16, right: 16),
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
        offset: Offset(0, 20),
      ),
    ],


        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(CupertinoIcons.back),
              ),
            ),
             Center(
              child: Text(
                title ,

                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
