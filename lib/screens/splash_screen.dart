import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartcalc/screens/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5), 
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [
              Text("SmartCalc",
              style: TextStyle(
                letterSpacing: 10,
                color: Colors.black,
                fontSize: 50,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                shadows: [
                 Shadow(
                  color: Colors.deepOrangeAccent,
                  blurRadius: 3.0,
                  offset: Offset.zero
                  ),
              ]
              ),
              ),

            Lottie.asset('assets/calculator.json',frameRate: const FrameRate(60),fit: BoxFit.contain ),
            
            ],
          ),
        ),
    );
    
  }
}