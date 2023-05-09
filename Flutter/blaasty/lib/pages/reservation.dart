import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Reservation extends StatefulWidget {
  final int hour;

  Reservation({required this.hour});

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  late String textCode;
  late DateTime currentTime;
  late DateTime endTime;

  @override
  void initState() {
    super.initState();
    textCode = generateTextCode();
    currentTime = DateTime.now();
    endTime = currentTime.add(Duration(hours: widget.hour));
  }

  String generateTextCode() {
    var now = DateTime.now();
    return "CODE-${now.year}${now.month}${now.day}-${now.hour}${now.minute}${now.second}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservation"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Text code: $textCode", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Text(
              "Current time: ${DateFormat("yyyy-MM-dd HH:mm:ss").format(currentTime)}",
              style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Text("End time: ${DateFormat("yyyy-MM-dd HH:mm:ss").format(endTime)}",
              style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
