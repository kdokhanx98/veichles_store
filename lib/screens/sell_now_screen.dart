import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SellScreen extends StatefulWidget {
  static const routeName = '/sell';

  @override
  _SellScreenState createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  var locationController = TextEditingController();
  var priceController = TextEditingController();
  var makeController = TextEditingController();
  var mileageController = TextEditingController();
  var descriptionController = TextEditingController();

  List<XFile>? selectedPics = [];
  final ImagePicker _picker = ImagePicker();
  bool isEmpty = true;
  var bodyTypeString;
  var makeString;
  var modelString;
  var transmissionString;
  var vehicleMakeYeartring;
  var exteriorString;
  var interiortring;

  var _makeYears = [
    "1970",
    "1971",
    "1972",
    "1973",
    "1974",
    "1975",
    "1976",
    "1977",
    "1978",
    "1979",
    "1980",
    "1981",
    "1982",
    "1983",
    "1984",
    "1985",
    "1986",
    "1987",
    "1988",
    "1989",
    "1990",
    "1991",
    "1992",
    "1993",
    "1994",
    "1995",
    "1996",
    "1997",
    "1998",
    "1999",
    "2001",
    "2002",
    "2003",
    "2004",
    "2005",
    "2006",
    "2007",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019",
    "2020",
    "2021",
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00B241),
        title: Text("Add Vehicle"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            isEmpty
                ? GestureDetector(
                    onTap: () {
                      print("clicked");
                      selectImages();
                    },
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
                                    style:
                                        TextStyle(color: Colors.grey.shade600))
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

            //Top Heading
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.local_offer_outlined,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Vehicle Price",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 47, right: 16),
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    controller: priceController,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: "Set a price",
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.green.shade300, width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5))),
                  ),
                )),
              ],
            ),

            //Top Heading
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.speed,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Mileage (Miles)",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 47, right: 16),
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    controller: mileageController,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: "Specifiy mileage",
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.green.shade300, width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5))),
                  ),
                )),
              ],
            ),

            //Top Heading
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.location_on,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Location",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 47, right: 16),
                  child: TextField(
                    // enabled: false,

                    onTap: () {
                      print("show map");
                    },
                    controller: locationController,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: "Pick location on map",
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.green.shade300, width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5))),
                  ),
                )),
              ],
            ),

            //one set of input field with label
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.drive_eta,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Body Type",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 47, right: 16),
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "Pick Body Type",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.green.shade300,
                                          width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              isEmpty: bodyTypeString == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: bodyTypeString,
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      bodyTypeString = newValue!;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _makeYears.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ))),
              ],
            ),

            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.toys,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Make",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 47, right: 16),
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "Pick make",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.green.shade300,
                                          width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              isEmpty: makeString == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: makeString,
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      makeString = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _makeYears.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ))),
              ],
            ),

            //Top Heading
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.list,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Model",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 47, right: 16),
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "Pick model",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.green.shade300,
                                          width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              isEmpty: modelString == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: modelString,
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      modelString = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _makeYears.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ))),
              ],
            ),
            //top heading
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.settings,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Transmission",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),

            //Input Fields
            Row(
              children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 47, right: 16),
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "Pick Transmission",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.green.shade300,
                                          width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              isEmpty: transmissionString == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: transmissionString,
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      transmissionString = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _makeYears.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ))),
              ],
            ),

            //Top Heading
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.calendar_today,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Vehicle Make Year",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 47, right: 16),
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "make year",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.green.shade300,
                                          width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              isEmpty: vehicleMakeYeartring == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: vehicleMakeYeartring,
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      vehicleMakeYeartring = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _makeYears.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ))),
              ],
            ),

            //Top Heading
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.color_lens,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Exterior Color",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 47, right: 16),
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "Pick Exterior Color",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.green.shade300,
                                          width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              isEmpty: exteriorString == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: exteriorString,
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      exteriorString = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _makeYears.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ))),
              ],
            ),

            //Top Heading
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.color_lens,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Interior Color",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 47, right: 16),
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "Pick Interior Color",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 5, 15, 5),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.green.shade300,
                                          width: 0.5)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              isEmpty: interiortring == '',
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: interiortring,
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      interiortring = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: _makeYears.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            );
                          },
                        ))),
              ],
            ),

            //Top Heading
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.description,
                                size: 20, color: Colors.grey.shade600),
                          ),
                          Text("Description",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800))
                        ])))
              ],
            ),
            //Input Fields
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(
                    left: 47,
                    right: 16,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 5,
                    controller: descriptionController,
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: "Description about your vehicle",
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Colors.green.shade300, width: 0.5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5))),
                  ),
                )),
              ],
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30.0,
                  bottom: 55.0,
                  left: 30.0,
                  right: 30.0,
                ),
                child: MaterialButton(
                  height: 50,
                  minWidth: 150,
                  onPressed: () {
                    print("add vehicle clicked");
                  },
                  color: Colors.green,
                  child: Text("Add Vehicle",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectImages() async {
    print("select clicked");
    if (selectedPics != null) {
      selectedPics!.clear();
    }
    selectedPics = await _picker.pickMultiImage();

    if (selectedPics != null) {
      setState(() {
        if (selectedPics!.isNotEmpty) {
          isEmpty = false;
        }
      });
    }
  }
}
