import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
        body: Column(
      children: [
        Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 60),
                      width: 300,
                      height: 300,
                      color: Colors.red,
                      child: Container(
                        margin: EdgeInsets.only(top: 18),
                        child: Text(
                          args['name'],
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  Row(
                    children: [],
                  )
                ],
              ),
            )
          ],
        )
      ],
    ));
  }
}

// Text('Price: ${args['price']}'),
