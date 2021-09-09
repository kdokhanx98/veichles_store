import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellScreen extends StatefulWidget {
  static const routeName = '/sell';

  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  List<XFile>? selectedPics = [];
  final ImagePicker _picker = ImagePicker();
  bool isEmpty = true;
  var bodyTypeString = "";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00B241),
        title: Text("Add Vehicle"),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              isEmpty
                  ? GestureDetector(
                      onTap: selectImages,
                      child: Container(
                        // alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            right: 35, left: 35, bottom: 15, top: 15),

                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                        ),
                        child: DottedBorder(
                            color: Colors.grey.shade400,
                            strokeWidth: 2,
                            child: Container(
                                padding: EdgeInsets.only(top: 30),
                                alignment: Alignment.center,
                                child: Column(children: [
                                  Icon(Icons.add_a_photo_outlined,
                                      size: 50, color: Colors.grey.shade500),
                                  Text("Add Photos",
                                      style: TextStyle(
                                          color: Colors.grey.shade600))
                                ]))),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SizedBox(
                        height: height * 0.4,
                        width: double.infinity,
                        child: GridView.builder(
                            itemCount: selectedPics!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                              return Center(
                                  child: Image.file(
                                      File(selectedPics![index].path),
                                      fit: BoxFit.cover));
                            }),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void selectImages() async {
    selectedPics!.clear();
    selectedPics = await _picker.pickMultiImage();
    selectedPics!.map((e) => print(e.path.toString())).toList();
    setState(() {
      if (selectedPics!.isNotEmpty) {
        isEmpty = false;
      }
    });
  }
}
