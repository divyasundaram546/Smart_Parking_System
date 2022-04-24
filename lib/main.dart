import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:smart_parking_system/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Parking System",
      theme: ThemeData(primarySwatch: Colors.green),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(0, 80, 0, 20),
        child: Center(
            child: Text(
          "Welcome to Smart Parking!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.green.shade700,
            fontFamily: 'Satisfy',
            fontWeight: FontWeight.w600,
            fontSize: 45,
          ),
        )),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: CircleAvatar(
            backgroundColor: Colors.green,
            radius: 160,
            child: CircleAvatar(
              radius: 150,
              backgroundImage: AssetImage('assets/parking.png'),
            ),
          )),
      Container(
        margin: const EdgeInsets.only(left: 50.0, right: 50, top: 20),
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green.shade900,
                Colors.green.shade700,
                Colors.green
              ]),
        ),
        child: MaterialButton(
          padding: EdgeInsets.fromLTRB(40, 25, 40, 25),
          shape: StadiumBorder(),
          child: Text(
            "Let's get started!",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Firstpage()));
          },
        ),
      )
    ]));
  }
}
