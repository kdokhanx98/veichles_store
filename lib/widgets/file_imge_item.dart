import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class FileImgeItem extends StatelessWidget {
List<XFile>? selectedPics;
int index;
FileImgeItem(this.selectedPics , this.index);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Image.file(File(selectedPics![index].path),
                                      fit: BoxFit.cover),
                                      Positioned(child: Icon(Icons.cancel)),


      ],
      
    );
  }
}