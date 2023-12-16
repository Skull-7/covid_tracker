import 'dart:async';

import 'package:covid_tracker/View/world_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animation=AnimationController(vsync: this,duration: Duration(seconds: 3))..repeat();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>worldscreen()));
    });

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animation.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              RotationTransition(
                  turns:_animation,
                child: Image.asset("assets/images/virus.png",
                  height: 200,
                  width: 200,)
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.4,
              ),
              Text("COVID-19",style: Theme.of(context).textTheme.headline1,),
              Text("Track COVID-19",style: Theme.of(context).textTheme.headline1,)
            ],
          ),
        ),
      ),
    );
  }
}
