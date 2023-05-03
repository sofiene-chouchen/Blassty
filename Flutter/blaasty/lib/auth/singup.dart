import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 90),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80,
                  child: Image.asset("images/BlastyyLogo.jpeg"),
                ),
              ),
              Form(
                  child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "username",
                          prefixIcon: Icon(Icons.contact_page_outlined),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: "E-mail",
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_outline_rounded),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 20, bottom: 10)),
                        const Text("Do you  Have Acount ?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("login");
                          },
                          child: const Text(
                            "Login ",
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Register "))),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
