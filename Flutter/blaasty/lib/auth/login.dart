import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 80,
              child: Image.asset("images/BlastyyLogo.jpeg"),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Form(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "E-mail",
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(left: 30, bottom: 10)),
                    const Text("Do you Not Have Acount ?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed("signeup");
                      },
                      child: const Text(
                        "Signup Here",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Login ",
                        style: TextStyle(fontSize: 18),
                      ))),
            ],
          ))
        ],
      ),
    );
  }
}
