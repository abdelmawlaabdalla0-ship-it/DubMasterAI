import 'package:flutter/cupertino.dart';

class robaotimage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return Container(
  width: 340,
  height: 200,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    image: DecorationImage(
      image: AssetImage("assets/LOGO ROBOAT.jpg"),
      fit: BoxFit.cover,
    ),
  ),
);
  }
}