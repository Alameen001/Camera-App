import 'dart:io';

import 'package:flutter/material.dart';

class Imageshow extends StatelessWidget {
   Imageshow({ Key? key,required this.path }) : super(key: key);
  String path;

 
  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: Image.file(File(path)),
      
    );
  }
}