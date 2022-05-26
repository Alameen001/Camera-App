import 'dart:io';

import 'package:camera_ameen/galaryscreen.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class camaraScreen extends StatefulWidget {
  camaraScreen({Key? key}) : super(key: key);
  File? images;

  @override
  State<camaraScreen> createState() => _camaraScreenState();
}

class _camaraScreenState extends State<camaraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CAMERA APP'),
        centerTitle: true,
        
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.yellow,
          ],
        )),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: ElevatedButton.icon(
                    onPressed: () {
                        camerapic();
                    },
                    icon: Icon(Icons.camera),
                    label: Text('Camera'))),
                    SizedBox(height: 20,),
            ElevatedButton.icon(
            
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => galaryscreen()),
                  );
                },
                icon: Icon(Icons.image_outlined),
                label: Text('galary'),
                ),
                
          ],
        ),
      ),
    );
  }

  camerapic() async {
    final imgee =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      if (imgee != null) {
        widget.images = File(imgee.path);
        GallerySaver.saveImage(imgee.path, albumName: 'flutter data');
      }
    });
  }

  // galary() async {
  //   final imgee =
  //       await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (imgee != null) {
  //       widget.images = File(imgee.path);
  //       GallerySaver.saveImage(imgee.path, albumName: 'flutter data');
  //     }
  //   });
  // }
}
