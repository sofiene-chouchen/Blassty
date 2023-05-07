import 'package:blaasty/auth/login.dart';
import 'package:blaasty/auth/singup.dart';
import 'package:flutter/material.dart';
import 'package:blaasty/pages/list.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const Blassty());
}

class Blassty extends StatelessWidget {
  const Blassty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        "login": (context) => const Login(),
        "signeup": (context) => const SignUp(),
        "list": (context) => const List()
      },
    );
  }
}
