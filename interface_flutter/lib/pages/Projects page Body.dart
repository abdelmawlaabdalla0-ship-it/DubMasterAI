import 'package:dubmasterai/pages/Dubbing Viwe.dart';
import 'package:dubmasterai/pages/Speechviwe.dart';
import 'package:dubmasterai/pages/SubtiltViwe.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProjectBodypage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon:Icon(Icons.cancel_outlined)),
            ],

            bottom: TabBar(
                labelColor: Colors.deepPurple,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.deepPurple,
                indicatorWeight: 5,
                indicatorAnimation: TabIndicatorAnimation.linear,
                indicatorSize: TabBarIndicatorSize.label,

                tabs: [
              Text("Dubbing",
              style: TextStyle(
                fontSize: 18,
              ),
              ),
              Text("Subtitle",
              style: TextStyle(
                fontSize: 18,

              ),
              ),
              Text("Speech",
              style: TextStyle(
                fontSize: 18,
              ),
              ),

            ]

            ),

          ),
          body:

          TabBarView(
            children:
          [
            DubbingViwe(),
            SubtitleView(),
            Speeechviwe(),



              ],),



















          ),













          );





  }



}