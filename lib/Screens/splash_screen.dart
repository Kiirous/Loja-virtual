import 'package:flutter/material.dart';
import 'package:loja_virtual/Screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image.asset('imagens/logo.png'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration(seconds: 4)).then((_){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    });
  }


}
