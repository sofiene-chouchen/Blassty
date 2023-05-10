import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final TextEditingController _hoursController = TextEditingController();
  double _totalPrice = 0;

  @override
  void dispose() {
    _hoursController.dispose();
    super.dispose();
  }

  void _calculateTotal() {
    final String? hoursText = _hoursController.text.trim();

    if (hoursText != null && hoursText.isNotEmpty) {
      final double hours = double.parse(hoursText);
      final Map<String, dynamic>? args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (args != null) {
        _totalPrice = hours * args['price'];
      }
    } else {
      _totalPrice = 0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args == null) {
      return Scaffold(
        body: Center(
          child: Text('No arguments passed'),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Reservation'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 60, left: 60),
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(blurRadius: 6)],
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            margin: EdgeInsets.only(top: 18),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      args['name'],
                                      style: TextStyle(fontSize: 20),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text(args['description']),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(args['nbPlace'].toString() +
                                          ' place disponible'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Text('${args['price']}dt/H'),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 50),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.purple)),
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.info,
                      body: Center(
                        child: Text(
                          "Reserved",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      title: 'This is Ignored',
                      desc: 'This is also Ignored',
                      btnOkOnPress: () {},
                    )..show();
                  },
                  child: Text("Reserver")),
            )
          ],
        ));
  }
}
