import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class List extends StatefulWidget {
  const List({super.key});
  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.779481194422694, 10.83021625071606),
    zoom: 10,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(35.779481194422694, 10.83021625071606),
      tilt: 59.440717697143555,
      zoom: 10);

  Future GetParking() async {
    var url = Uri.parse("http://192.168.1.17:5000/parking");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Blassty"),
          centerTitle: true,
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Material(
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 55,
                  color: Colors.white,
                  child: TabBar(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    unselectedLabelColor: Colors.blue,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(width: 1, color: Colors.blue)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("List"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(width: 1, color: Colors.blue)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Map"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  FutureBuilder(
                    future: GetParking(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, int) {
                            return Container(
                              height: 100,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                boxShadow: [BoxShadow(blurRadius: 6)],
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 15, top: 20),
                                          width: 200,
                                          child: Row(
                                            children: [
                                              Text(
                                                "${snapshot.data[int]['name']}",
                                                style: TextStyle(fontSize: 25),
                                              )
                                            ],
                                          )),
                                      Container(
                                          padding: EdgeInsets.only(left: 50),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(Icons.calculate_outlined),
                                              Text(
                                                "${snapshot.data[int]['price']}DT/H",
                                                style: TextStyle(fontSize: 16),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 180,
                                        padding:
                                            EdgeInsets.only(left: 20, top: 3),
                                        child: Row(
                                          children: [
                                            Icon(Icons.location_on_outlined),
                                            Text(
                                              "${snapshot.data[int]['description']}",
                                              style: TextStyle(fontSize: 14),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(
                                              top: 15, left: 45),
                                          child: Text(
                                            "${snapshot.data[int]['nbPlace']} place Disponible",
                                            style: TextStyle(fontSize: 14),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                  Container(
                    width: 400,
                    height: 500,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  )
                ],
              ))
            ],
          ),
        ));
  }
}
