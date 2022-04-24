import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Smart Parking System"), backgroundColor: Colors.green),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(100, 150, 100, 20),
              child: Text(
                'License Plate Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade900),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(100, 20, 100, 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'HR26DQ5551',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900),
                  ),
                ))
          ],
        ));
  }
}
