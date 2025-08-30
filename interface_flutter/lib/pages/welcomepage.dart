import 'package:dubmasterai/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcomepage extends StatefulWidget{
  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> with TickerProviderStateMixin  {
  @override
  late AnimationController animationController;
  late Animation <Offset>Seladinganimation;
  @override
  void initState() {
    anamtionsliding();

    navgatetohome();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return   Scaffold(



 body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),

            SizedBox(
              width: MediaQuery.of(context).size.height*0.3,
              height: MediaQuery.of(context).size.height*0.3,

              child:Image.asset("assets/dubmaster_ai_flat_logo (1).png",

              ),

            ),

            SlideTransition(
              position:Seladinganimation,
              child: Text("welcome",
                style: TextStyle(
                  fontSize: 40,

                ),
                textAlign: TextAlign.center,

              ),
            ),



            SizedBox(
              height: 40,
            ),




            SizedBox(
              height: 300,
            ),






          ],



        ),




     ),
    );





  }


  anamtionsliding(){
    animationController =AnimationController(
      vsync:this,
      duration: Duration(seconds: 2),

    );
    Seladinganimation=Tween<Offset>(begin: Offset(0, 10),end:(Offset.zero)).animate(animationController);
    animationController.forward();
    Seladinganimation.addListener((){
      setState(() {

      });

    });



  }
  navgatetohome(){
    Future.delayed(Duration(seconds: 3),(){
      token != null && token!.isNotEmpty ?Navigator.pushNamed(context,'HOMEPAGE' ) :    Navigator.pushNamed(context, "Userviwe");





    });

  }

}