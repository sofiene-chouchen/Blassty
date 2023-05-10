import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class List extends StatefulWidget {
  const List({super.key});
  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  Future<void> requestPermissionAndOpenSettings() async {
    var status = await Permission.location.status;
    if (status == PermissionStatus.denied) {
      status = await Permission.location.request();
      if (status == PermissionStatus.denied) {
        // Open app settings if permission is permanently denied
        if (await Permission.location.isPermanentlyDenied) {
          openAppSettings();
        }
      } else if (status == PermissionStatus.granted) {
        // Permission granted, call getValue() to get user's location
      }
    } else if (status == PermissionStatus.granted) {
      // Permission already granted, call getValue() to get user's location
    }
  }

  Future getPostion() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      per = await Geolocator.checkPermission();
      if (per == LocationPermission.denied) {
        per = await Geolocator.requestPermission();
        if (per == LocationPermission.always) {
          return per;
        }
      }
    }
  }

  @override
  void initState() {
    getPostion();

    requestPermissionAndOpenSettings();

    super.initState();
  }

  Future GetParking() async {
    var url = Uri.parse("http://192.168.1.17:5000/parking");
    // var url = Uri.parse("http://10.99.8.34:5000/parking");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);

    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("MY_PARKING"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: GetParking(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/details', arguments: {
                      'name': snapshot.data[int]['name'],
                      'price': snapshot.data[int]['price'],
                      'description': snapshot.data[int]['description'],
                      'nbPlace': snapshot.data[int]['nbPlace']
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 6)],
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 80, top: 20),
                            width: 200,
                            child: Row(
                              children: [
                                Text(
                                  "${snapshot.data[int]['name']}",
                                  style: TextStyle(fontSize: 25),
                                )
                              ],
                            )),
                        SizedBox(height: 20),
                        Container(
                            padding: EdgeInsets.only(left: 100),
                            child: Row(
                              children: [
                                Icon(Icons.calculate_outlined),
                                Text(
                                  "${snapshot.data[int]['price']}DT/H",
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.only(top: 15, left: 10),
                            child: Text(
                              "${snapshot.data[int]['nbPlace']} place Disponible",
                              style: TextStyle(fontSize: 14),
                            )),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
