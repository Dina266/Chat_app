import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(child: Text(
        'loading ...',
        style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),
      )),
    );
  }
}