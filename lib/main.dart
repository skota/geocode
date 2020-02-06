import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Geolocator example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController address = TextEditingController();
  TextEditingController input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: input,
                  decoration:
                      InputDecoration(hintText: 'Enter address to geocode'),
                ),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  child: Text("Geocode address"),
                  onPressed: () async {
                    print("address to geocode");
                    print(input.text);

                    List<Placemark> placemark =
                        await Geolocator().placemarkFromAddress(input.text);

                    setState(() {
                      address.text =
                          "Latitude: ${placemark[0].position.latitude} Longitute : ${placemark[0].position.longitude}";
                    });
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: address,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
