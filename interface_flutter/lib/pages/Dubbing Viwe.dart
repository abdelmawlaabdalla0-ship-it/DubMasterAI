import 'package:dubmasterai/Widgets/Item%20dubbing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DubbingViwe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            videodubbingitam(),
            SizedBox(
              height: 30,
            ),
            videodubbingitam(),
            SizedBox(
              height: 30,
            ),
            videodubbingitam(),
            SizedBox(
              height: 30,
            ),
            videodubbingitam(),

          ],
        ),
      ) ,
    );
  }


}