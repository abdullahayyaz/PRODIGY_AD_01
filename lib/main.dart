import 'package:flutter/material.dart';
import 'package:smartcalc/screens/home_screen.dart';
import 'package:smartcalc/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartCalc',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 229, 141, 159)),
        useMaterial3: true,
      ),
      routes: {
        'splash':(context) => SplashScreen(),
        '/':(context) => HomeScreen(),
      },
      initialRoute: 'splash',
    );
  }
}

