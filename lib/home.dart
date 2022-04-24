import 'dart:io';
import 'secondpage.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for caputred image

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Smart Parking System"), backgroundColor: Colors.green),
      body: Container(
          child: Column(children: [
        Container(
            height: 400,
            width: 400,
            child: controller == null
                ? Center(child: Text("Loading Camera..."))
                : !controller!.value.isInitialized
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CameraPreview(controller!)),
        // Container(
        //   //show captured image
        //   padding: EdgeInsets.all(30),
        //   child: image == null
        //       ? Text("No image captured")
        //       : Image.file(
        //           File(image!.path),
        //           height: 300,
        //         ),
        //   //display captured image
        // )
      ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () async {
          try {
            if (controller != null) {
              //check if contrller is not null
              if (controller!.value.isInitialized) {
                //check if controller is initialized
                image = await controller!.takePicture(); //capture image
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );

                setState(() {
                  //update UI
                });
              }
            }
          } catch (e) {
            print(e); //show error
          }
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
