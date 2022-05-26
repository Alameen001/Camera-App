import 'dart:io';
import 'package:camera_ameen/imageshow.dart';
import 'package:flutter/material.dart';

final Directory _photoDir =
    Directory('/storage/emulated/0/Pictures/flutter data/');

class galaryscreen extends StatefulWidget {
  @override
  PhotosState createState() {
    return new PhotosState();
  }
}

class PhotosState extends State {
  @override
  Widget build(BuildContext context) {
    
      var imageList = _photoDir
          .listSync()
          .map((item) => item.path)
          .where((item) => item.endsWith(".jpg"))
          .toList();

      if (imageList.length > 0) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Galary Images"),
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
            padding: EdgeInsets.only(bottom: 60.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20, 
                  mainAxisSpacing: 20),
              padding: const EdgeInsets.all(8.0),
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                String imgPath = imageList[index];
                return Material(
                  elevation: 8.0,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Imageshow(path: imgPath),));
                    },
                    child: Hero(
                      tag: imgPath,
                      child: Image.file(
                        File(imgPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text("Galary images"),
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.only(bottom: 60.0),
              child: Text(
                "Sorry, No Images Where Found.",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        );
      }
    }
  }
