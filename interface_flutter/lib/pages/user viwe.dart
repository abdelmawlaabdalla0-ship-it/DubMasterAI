import 'package:flutter/material.dart';
import 'package:dubmasterai/pages/sign%20up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Sign in.dart';
import 'package:dubmasterai/Cubites/Sign up/Sign up cubit.dart';

class userviwe extends StatefulWidget {
  @override
  State<userviwe> createState() => userviweState();
}

class userviweState extends State<userviwe> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Signupcubite(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: 50,
            leading: IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.exit_to_app_rounded)),
          ),
          body: Column(
            children: [

              Image.asset("assets/mic logo.png", height: 120),
              SizedBox(height: 30),
              Padding(
                  child: TabBar(

                    labelColor: Colors.deepPurple,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.deepPurple,
                    indicatorWeight: 5,
                    indicatorAnimation: TabIndicatorAnimation.linear,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(text: "Sign up"),
                      Tab(text: "Log in"),

                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24)


              ),


              Expanded(
                child: TabBarView(
                  children: [
                    Signup(),

                    sigin(),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
