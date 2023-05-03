import 'package:flutter/material.dart';

class List extends StatefulWidget {
  const List({super.key});
  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
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
                  margin: EdgeInsets.only(top: 20),
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
                children: [Text("List"), Text("Map")],
              ))
            ],
          ),
        ));
  }
}
