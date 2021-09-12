import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motor_bike_new/screens/contact_us_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // List<Tuple2> _pages = [];
  var position = 0;
  var financingVehiclePriceCont = TextEditingController();
  var financingInterestRateCont = TextEditingController();
  var financingDownPaymentCont = TextEditingController();
  var financingPeriodCont = TextEditingController();

  bool _visible = false;
  var _totalInterest = "0";
  var _paymentPerMonth = "0";
  var _totalToBePaid = "0";

  void onSaveClicked() async {
    var p = int.parse(financingVehiclePriceCont.text) -
        int.parse(financingDownPaymentCont.text); //total loan amount

    var r = int.parse(financingInterestRateCont.text) /
        12 /
        100; //annual interest rate 3 / 12 = 0.25 ... 0.25/100 = 0.0025
    var n = int.parse(financingPeriodCont.text);

    var powered = pow((1 + r), n);
    var x = r * powered;
    var y = powered - 1;

    var paymentPerMonth = (p * (x / y));
    var totalInterest = ((paymentPerMonth * n) - p);
    var totalToBePaid =
        ((paymentPerMonth * n)) + int.parse(financingDownPaymentCont.text);

    setState(() {
      _visible = false;
    });

    setState(() {
      _paymentPerMonth = paymentPerMonth.round().toString();
      _totalToBePaid = totalToBePaid.round().toString();
      _totalInterest = totalInterest.round().toString();
    });

    setState(() {
      _visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: 'Details',
              ),
              Tab(text: 'Financing Calculator'),
            ],
          ),
          backgroundColor: Color(0xff00B241),
          backwardsCompatibility: true,
          title: Text("Product Details"),
        ),
        body: TabBarView(
          children: [
            // details page content
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // image slider
                  Container(
                    height: height * 0.3,
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return Image.asset(
                          'assets/2a.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      onPageChanged: (index) {
                        position = index;
                        setState(() {});
                      },
                    ),
                  ),
                  // product info
                  Padding(
                    padding:
                        EdgeInsets.only(top: 5, left: 14, right: 14, bottom: 5),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "2019 Ford TurtleTop Vanterra Non-CDL Executive Coach",
                                style: TextStyle(
                                    color: Color(0xFF212121), fontSize: 18),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "\$87,900",
                                      style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 5, right: 5),
                                    margin: EdgeInsets.only(top: 10, right: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.grey.shade600,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.calendar_today_outlined,
                                          color: Colors.grey.shade600,
                                          size: 18.0,
                                          semanticLabel: 'make',
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Text("2019",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.grey.shade600))),
                                      ],
                                    )),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 1,
                                          right: 1),
                                      margin: EdgeInsets.only(
                                          top: 10, left: 2, right: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey.shade600,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.speed,
                                            color: Colors.grey.shade600,
                                            size: 18.0,
                                            semanticLabel: 'mileage',
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(" 1235 mi.",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .grey.shade600))),
                                        ],
                                      ))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 5,
                                          right: 5),
                                      margin: EdgeInsets.only(
                                          top: 10, left: 2, right: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey.shade600,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.local_gas_station,
                                            color: Colors.grey.shade600,
                                            size: 18.0,
                                            semanticLabel: 'fuel',
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text("Gasoline",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .grey.shade600))),
                                        ],
                                      ))),
                              Expanded(
                                flex: 1,
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 10, bottom: 10, left: 5, right: 5),
                                    margin: EdgeInsets.only(top: 10, left: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.grey.shade600,
                                        width: 1,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.drive_eta,
                                          color: Colors.grey.shade600,
                                          size: 18.0,
                                          semanticLabel: 'transmission',
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: Text("Automatic",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.grey.shade600))),
                                      ],
                                    )),
                              )
                            ]),
                      ],
                    ),
                  ),

                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: <Widget>[
                              Text(
                                "Brand NEW 2019 Leftover Tutleop Vanterra (AKA The Sprinter Killer!) Non-CDL Executive Seating for 13 + Driver TV, Woodlock Flooring, Large Front View Window, & Rear Luggage Financing Available",
                                maxLines: 8,
                                style: TextStyle(fontSize: 16),
                              ), //isExpanded
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.only(left: 0, top: 20, right: 0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        color: Color(0xFFF1F1F1),
                                        child: Text(
                                          "Body Type",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: 4, bottom: 4, left: 24),
                                        color: Color(0xFFF8F8F8),
                                        child: Text(
                                          "Executive Coach",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        color: Color(0xFFF1F1F1),
                                        child: Text(
                                          "Make Year",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: 4, bottom: 4, left: 24),
                                        color: Color(0xFFF8F8F8),
                                        child: Text(
                                          "2019",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        color: Color(0xFFF1F1F1),
                                        child: Text(
                                          "Fuel Type",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: 4, bottom: 4, left: 24),
                                        color: Color(0xFFF8F8F8),
                                        child: Text(
                                          "Gasoline",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        color: Color(0xFFF1F1F1),
                                        child: Text(
                                          "Mileage",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: 4, bottom: 4, left: 24),
                                        color: Color(0xFFF8F8F8),
                                        child: Text(
                                          "1235",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        color: Color(0xFFF1F1F1),
                                        child: Text(
                                          "Transmission",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: 4, bottom: 4, left: 24),
                                        color: Color(0xFFF8F8F8),
                                        child: Text(
                                          "Automatice",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        color: Color(0xFFF1F1F1),
                                        child: Text(
                                          "Color",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: 4, bottom: 4, left: 24),
                                        color: Color(0xFFF8F8F8),
                                        child: Text(
                                          "Black",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        color: Color(0xFFF1F1F1),
                                        child: Text(
                                          "Interior Color",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: 4, bottom: 4, left: 24),
                                        color: Color(0xFFF8F8F8),
                                        child: Text(
                                          "Black",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        color: Color(0xFFF1F1F1),
                                        child: Text(
                                          "VIN",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: 4, bottom: 4, left: 24),
                                        color: Color(0xFFF8F8F8),
                                        child: Text(
                                          "1FDWE3FS6KDC",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        color: Color(0xFFF1F1F1),
                                        child: Text(
                                          "Engine",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: 4, bottom: 4, left: 24),
                                        color: Color(0xFFF8F8F8),
                                        child: Text(
                                          "Gas",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        color: Color(0xFFF1F1F1),
                                        child: Text(
                                          "Stock Number",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: 4, bottom: 4, left: 24),
                                        color: Color(0xFFF8F8F8),
                                        child: Text(
                                          "DC10034",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.only(top: 4, bottom: 4),
                                        color: Color(0xFFF1F1F1),
                                        child: Text(
                                          "Wheels",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            top: 4, bottom: 4, left: 24),
                                        color: Color(0xFFF8F8F8),
                                        child: Text(
                                          "Simulators",
                                          style: TextStyle(
                                              color: Color(0xFF212121),
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.only(
                        left: 14,
                        right: 14,
                      ), //top: 5

                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 19,
                            child: GestureDetector(
                              onTap: () {
                                print("submit clicked");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                    color: Colors.green),
                                child: Center(
                                    child: Text(
                                  "SUBMIT OFFER",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                              ),
                            ),
                          ),
                          Expanded(flex: 1, child: Text("")),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  color: Colors.green.shade100),
                              child: Icon(
                                Icons.favorite_border_outlined,
                                size: 25,
                                color: Colors.green,
                              ),
                              alignment: Alignment.center,
                              height: double.infinity,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // financing calculator content
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 60),
              child: Container(
                margin: EdgeInsets.only(left: 16, top: 20, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                          controller: financingVehiclePriceCont,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          style: TextStyle(fontSize: 16),
                          autofocus: false,
                          onFieldSubmitted: (term) {
                            FocusScope.of(context).nextFocus();
                          },
                          decoration: formFieldDecoration("Vehicle Price (\$)"),
                        )),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: financingInterestRateCont,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(fontSize: 16),
                            autofocus: false,
                            onFieldSubmitted: (term) {
                              FocusScope.of(context).nextFocus();
                            },
                            decoration:
                                formFieldDecoration("Interest Rate (%)"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: financingPeriodCont,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(fontSize: 16),
                            autofocus: false,
                            onFieldSubmitted: (term) {
                              FocusScope.of(context).nextFocus();
                            },
                            decoration: formFieldDecoration("Period (Months)"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: financingDownPaymentCont,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.words,
                            style: TextStyle(fontSize: 16),
                            autofocus: false,
                            onFieldSubmitted: (term) {
                              FocusScope.of(context).nextFocus();
                            },
                            decoration:
                                formFieldDecoration("Down Payment (\$)"),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                      child: MaterialButton(
                        height: 50,
                        // minWidth: double.infinity,
                        minWidth: 150,
                        // shape:          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                        onPressed: () {
                          if (financingVehiclePriceCont.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Vehicle Price is required",
                                toastLength: Toast.LENGTH_SHORT);
                          } else if (financingInterestRateCont.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Interest Rate is required",
                                toastLength: Toast.LENGTH_SHORT);
                          } else if (financingPeriodCont.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Financing Period is required",
                                toastLength: Toast.LENGTH_SHORT);
                          } else if (financingDownPaymentCont.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Down Payment is required",
                                toastLength: Toast.LENGTH_SHORT);
                          } else {
                            onSaveClicked();
                          }
                        },
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "CALCULATE",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: _visible,
                        child: Table(
                            border: TableBorder.symmetric(
                                inside: BorderSide(width: 1),
                                outside: BorderSide(width: 1)),
                            children: [
                              TableRow(children: [
                                Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text("Monthly Payment")),
                                Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(_paymentPerMonth)),
                              ]),
                              TableRow(children: [
                                Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text("Total Interest Payment")),
                                Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(_totalInterest))
                              ]),
                              TableRow(children: [
                                Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text("Total Amount to Pay")),
                                Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(_totalToBePaid)),
                              ]),
                            ])),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
