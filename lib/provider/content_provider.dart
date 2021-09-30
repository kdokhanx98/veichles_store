import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:motor_bike_new/models/catgeroy.dart';
import 'package:motor_bike_new/models/filtter.dart';
import 'package:motor_bike_new/models/vehicle.dart';

import '../api_url.dart';

class Contentrovider with ChangeNotifier {
  List<Vehicle> _vehicleList = [];
  List<Vehicle> get getvehicleLList {
    return [..._vehicleList];
  }

  int bottumIndex = 0;

  setBottumIndex(int index) {
    bottumIndex = index;
    notifyListeners();
  }

  Filtter? filtter = Filtter(
      priceLowValue: "0",
      pricehigherValue: "500000",
      mileageLowValue: "0",
      mileagehigherValue: "500000",
      modelYearLowValue: "1970",
      modelYearhigherValue: "2021",
      bodyType: [
        "Executive Coach",
        "Limo Bus",
        "Limousin Vans",
        "Luxury Sedan",
        "Luxury SUV",
        "Mini Coach",
        "Motor Coach",
      ],
      transmission: [
        "Automatic",
        "Manual",
        "Allison",
        "Automated Manual Transmission",
        "CVT"
      ]);
  String? location;

  changeData(String newData) {
    location = newData;
    notifyListeners();
  }

  List<Catgeroy> _catgeroyList = [];
  List<Catgeroy> get getCatgeroyLList {
    return [..._catgeroyList];
  }

  Future<void> getURecentlyRequest() async {
    // check if Token avilable

    final url = Uri.parse(getRecentlyAdded);

    try {
      final response = await http.get(
        url,
      );

      final responseData = json.decode(response.body);
      // log("DataresponseData : $responseData");

      // if (responseData['status'] == true) {

      // } else {
      //   final massage = responseData['message'];

      //   // Fluttertoast.showToast(
      //   //     msg: massage,
      //   //     toastLength: Toast.LENGTH_LONG,
      //   //     gravity: ToastGravity.CENTER,
      //   //     timeInSecForIosWeb: 1,
      //   //     backgroundColor: Colors.white,
      //   //     textColor: Colors.black,
      //   //     fontSize: 16.0);

      //  }

      print("sussec");
      final recentAdded = responseData as List<dynamic>;
      _vehicleList.clear();
      recentAdded.map((e) {
        _vehicleList.add(Vehicle(
            carleaderListingColor: e['metadata'].containsKey("_carleader_listing_color")
                ? e['metadata']['_carleader_listing_color'][0]
                : " ",
            carleaderListingCondition: "",
            carleaderListingModelName:
                e['metadata'].containsKey("_carleader_listing_model_name")
                    ? e['metadata']['_carleader_listing_model_name'][0]
                    : " None",
            yser: e['metadata'].containsKey("_carleader_listing_model_year")
                ? e['metadata']['_carleader_listing_model_year'][0]
                : "None",
            wpufFormId: "",
            title: e['title']['rendered'] ?? "",
            seatingCapacity: "",
            image: e['images'] != ""
                ? (e['images'] as List<dynamic>)
                    .map((element) => element.toString())
                    .toList()
                : [],
            carleaderListingEngine: e['metadata'].containsKey('_carleader_listing_engine')
                ? e['metadata']['_carleader_listing_engine'][0]
                : "None",
            carleaderListingMiles: e['metadata'].containsKey('_carleader_listing_miles')
                ? e['metadata']['_carleader_listing_miles'][0]
                : "None",
            interiorColor: "",
            id: e['id'].toString(),
            carleaderListingModelTransmissionType: e['metadata']
                    .containsKey("_carleader_listing_model_transmission_type")
                ? e['metadata']['_carleader_listing_model_transmission_type'][0]
                : "",
            carleaderListingOdometer:
                e['metadata'].containsKey("_carleader_listing_odometer")
                    ? e['metadata']['_carleader_listing_odometer'][0]
                    : "",
            carleaderListingPrice: e['metadata'].containsKey("_carleader_listing_price") ? e['metadata']['_carleader_listing_price'][0] : "50",
            metaBodyTitle: e['body-type'][0].containsKey("name") ? e['body-type'][0]['name'] : "None",
            carleaderListingEngineflue: e['metadata'].containsKey("_carleader_listing_model_engine_fuel") ? e['metadata']['_carleader_listing_model_engine_fuel'][0] : "Gaz",
            carleaderListingWheels: e['metadata'].containsKey('_carleader_listing_wheels') ? e['metadata']['_carleader_listing_wheels'][0] : "",
            content: e['content']['rendered'] ?? "",
            carleaderListingVin: e['metadata'].containsKey("_carleader_listing_vin") ? e['metadata']['_carleader_listing_vin'][0] : ""));
      }).toList();
      print('addedLog length : ${_vehicleList.length}');

      notifyListeners();
      print("--------------------------------");
    } catch (e) {
      print(" addedLog $e");
    }
  }

  List<Vehicle> _catevehicleList = [];
  List<Vehicle> get getCatevehicleLList {
    return [..._catevehicleList];
  }

  Future<void> getCageDateRequest(String id) async {
    // check if Token avilable

    final url = Uri.parse("$getCatgeroyDateRequestUrl$id");

    try {
      final response = await http.get(
        url,
      );

      final responseData = json.decode(response.body);

      print("responseData $responseData");

      print("sussec");
      final recentAdded = responseData as List<dynamic>;
      _catevehicleList.clear();
      recentAdded.map((e) {
        _catevehicleList.add(Vehicle(
            carleaderListingColor: e['metadata'].containsKey("_carleader_listing_color")
                ? e['metadata']['_carleader_listing_color'][0]
                : " ",
            carleaderListingCondition: "",
            carleaderListingModelName:
                e['metadata'].containsKey("_carleader_listing_model_name")
                    ? e['metadata']['_carleader_listing_model_name'][0]
                    : " None",
            yser: e['metadata'].containsKey("_carleader_listing_model_year")
                ? e['metadata']['_carleader_listing_model_year'][0]
                : "None",
            wpufFormId: "",
            title: e['title']['rendered'] ?? "",
            seatingCapacity: "",
            image: e['images'] != ""
                ? (e['images'] as List<dynamic>)
                    .map((element) => element.toString())
                    .toList()
                : [],
            carleaderListingEngine: e['metadata'].containsKey('_carleader_listing_engine')
                ? e['metadata']['_carleader_listing_engine'][0]
                : "None",
            carleaderListingMiles: e['metadata'].containsKey('_carleader_listing_miles')
                ? e['metadata']['_carleader_listing_miles'][0]
                : "None",
            interiorColor: "",
            id: e['id'].toString(),
            carleaderListingModelTransmissionType: e['metadata']
                    .containsKey("_carleader_listing_model_transmission_type")
                ? e['metadata']['_carleader_listing_model_transmission_type'][0]
                : "",
            carleaderListingOdometer:
                e['metadata'].containsKey("_carleader_listing_odometer")
                    ? e['metadata']['_carleader_listing_odometer'][0]
                    : "",
            carleaderListingPrice: e['metadata'].containsKey("_carleader_listing_price") ? e['metadata']['_carleader_listing_price'][0] : "50",
            metaBodyTitle: e['body-type'][0].containsKey("name") ? e['body-type'][0]['name'] : "None",
            carleaderListingEngineflue: e['metadata'].containsKey("_carleader_listing_model_engine_fuel") ? e['metadata']['_carleader_listing_model_engine_fuel'][0] : "Gaz",
            carleaderListingWheels: e['metadata'].containsKey('_carleader_listing_wheels') ? e['metadata']['_carleader_listing_wheels'][0] : "",
            content: e['content']['rendered'] ?? "",
            carleaderListingVin: e['metadata'].containsKey("_carleader_listing_vin") ? e['metadata']['_carleader_listing_vin'][0] : ""));
      }).toList();
      print('addedLog length : ${_vehicleList.length}');

      notifyListeners();
      print("--------------------------------");
    } catch (e) {
      print(" addedLog $e");
    }
  }

  List<Vehicle> _allVehicleList = [];
  List<Vehicle> get getAllVehicleLList {
    return [..._allVehicleList];
  }

  Future<bool> getFiltterRequest() async {
    // check if Token avilable

    log("modelYearLowValue : ${filtter!.modelYearLowValue}");
    log("modelYearhigherValue : ${filtter!.modelYearhigherValue}");
    log("mileageLowValue : ${filtter!.mileageLowValue}");
    log("mileagehigherValue : ${filtter!.mileagehigherValue}");
    log("transmission : ${filtter!.transmission.join(",")}");
    log("pricehigherValue : ${filtter!.pricehigherValue}");
    log("priceLowValue : ${filtter!.priceLowValue}");

    final url = Uri.parse(
        "$getRecentlyAdded&year_from=${filtter!.modelYearLowValue}&year_to=${filtter!.modelYearhigherValue}&miles_from=${filtter!.mileageLowValue}&miles_to=${filtter!.mileagehigherValue}&price_from=${filtter!.priceLowValue}&price_to=${filtter!.pricehigherValue}&transmission=${filtter!.transmission.join(",")}");
    log("url : $url");

    try {
      final response = await http.get(
        url,
      );

      final responseData = json.decode(response.body);
      log("DataresponseData : $responseData");

      // if (responseData['status'] == true) {

      // } else {
      //   final massage = responseData['message'];

      // Fluttertoast.showToast(
      //     msg: massage,
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.white,
      //     textColor: Colors.black,
      //     fontSize: 16.0);

      print("sussec");
      final recentAdded = responseData as List<dynamic>;
      _allVehicleList.clear();
      recentAdded.map((e) {
        _allVehicleList.add(Vehicle(
            carleaderListingColor: e['metadata'].containsKey("_carleader_listing_color")
                ? e['metadata']['_carleader_listing_color'][0]
                : " ",
            carleaderListingCondition: "",
            carleaderListingModelName:
                e['metadata'].containsKey("_carleader_listing_model_name")
                    ? e['metadata']['_carleader_listing_model_name'][0]
                    : " None",
            yser: e['metadata'].containsKey("_carleader_listing_model_year")
                ? e['metadata']['_carleader_listing_model_year'][0]
                : "None",
            wpufFormId: "",
            title: e['title']['rendered'] ?? "",
            seatingCapacity: "",
            image: e['images'] != ""
                ? (e['images'] as List<dynamic>)
                    .map((element) => element.toString())
                    .toList()
                : [],
            carleaderListingEngine: e['metadata'].containsKey('_carleader_listing_engine')
                ? e['metadata']['_carleader_listing_engine'][0]
                : "None",
            carleaderListingMiles: e['metadata'].containsKey('_carleader_listing_miles')
                ? e['metadata']['_carleader_listing_miles'][0]
                : "None",
            interiorColor: "",
            id: e['id'].toString(),
            carleaderListingModelTransmissionType: e['metadata']
                    .containsKey("_carleader_listing_model_transmission_type")
                ? e['metadata']['_carleader_listing_model_transmission_type'][0]
                : "",
            carleaderListingOdometer:
                e['metadata'].containsKey("_carleader_listing_odometer")
                    ? e['metadata']['_carleader_listing_odometer'][0]
                    : "",
            carleaderListingPrice: e['metadata'].containsKey("_carleader_listing_price") ? e['metadata']['_carleader_listing_price'][0] : "50",
            metaBodyTitle: e['body-type'][0].containsKey("name") ? e['body-type'][0]['name'] : "None",
            carleaderListingEngineflue: e['metadata'].containsKey("_carleader_listing_model_engine_fuel") ? e['metadata']['_carleader_listing_model_engine_fuel'][0] : "Gaz",
            carleaderListingWheels: e['metadata'].containsKey('_carleader_listing_wheels') ? e['metadata']['_carleader_listing_wheels'][0] : "",
            content: e['content']['rendered'] ?? "",
            carleaderListingVin: e['metadata'].containsKey("_carleader_listing_vin") ? e['metadata']['_carleader_listing_vin'][0] : ""));
      }).toList();
      print('addedLog  : ${_vehicleList.length}');
      notifyListeners();
      return true;
    } catch (e) {
      print(" addedLog $e");
      return false;
    }
  }

  Future<void> getCatgeroyRequest() async {
    // check if Token avilable

    final url = Uri.parse(getCatgeroyRequestUrl);

    try {
      final response = await http.get(
        url,
      );

      final responseData = json.decode(response.body);
      //log("DataresponseData : $responseData");

      print("sussec");
      final recentAdded = responseData as List<dynamic>;
      _catgeroyList.clear();
      recentAdded.map((e) {
        _catgeroyList.add(Catgeroy(
            count: e['count'].toString(),
            id: e['id'].toString(),
            name: e['name'].toString(),
            featuerdImage: e['featured_image'].toString(),
            description: e['description'].toString()));
      }).toList();
      print('addedLog length : ${_catgeroyList.length}');

      notifyListeners();
      print("--------------------------------");
    } catch (e) {
      print(" addedLog $e");
    }
  }
}
