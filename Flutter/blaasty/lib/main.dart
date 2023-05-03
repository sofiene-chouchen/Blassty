import 'package:blaasty/auth/login.dart';
import 'package:blaasty/auth/singup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Blassty());
}

class Blassty extends StatelessWidget {
  const Blassty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      routes: {
        "login": (context) => const Login(),
        "signeup": (context) => const SignUp()
      },
    );
  }
}
