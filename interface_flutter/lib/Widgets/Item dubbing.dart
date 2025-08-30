import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class videodubbingitam extends StatefulWidget{

  @override
  State<videodubbingitam> createState() => _videodubbingitamState();
}

class _videodubbingitamState extends State<videodubbingitam> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2
        ),
        borderRadius: BorderRadius.circular(16),

      ),
      width: 200,
      height: 100,
     child:
     ListTile(




       title: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           Text("Oliver Twist",
           style: TextStyle(
             fontSize: 18,
           ),
           ),
           SizedBox(
             height: 10,
           ),
           Row(
             children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow_outlined)),


               IconButton(onPressed: (){}, icon:Icon(Icons.downloading_outlined)),
             ],
           ),
         ],
       ),
       trailing:  PopupMenuButton(itemBuilder: (context)=>[
         PopupMenuItem(child:Text("Delete") ),
         PopupMenuItem(child:Text("Rename") ),



       ]),

     ),

    );
  
  }
}