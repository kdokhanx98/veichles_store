import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motor_bike_new/constants.dart';
import 'package:motor_bike_new/provider/content_provider.dart';
import 'package:motor_bike_new/screens/sell_now_screen.dart';
import 'package:provider/provider.dart';

const kGoogleApiKey = "AIzaSyDuvKjR_UiGlyNhUryUHiIzJ9inbecS7F4";

class GetLocation extends StatefulWidget {
  static const routeName = '/GetLocation';

  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

       floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('My Loction!'),
        icon: Icon(Icons.location_on),
      ),

      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.of(context).pop();
        }),
    centerTitle: true,
    title: Text("Address Detail"),
  
  ),
  bottomNavigationBar: Container(
    color: Colors.transparent,
    height: 56,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new FlatButton.icon(
          icon: Icon(Icons.arrow_back_ios),
          label: Text('Show Address'),
          textColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          onPressed: () {
            getUserLocation();
          },
        ),
      ],
    ),
  ),
  body: Container(
    height: double.infinity,
    width: double.infinity,
    child: Stack(
      children: <Widget>[
        _searchbar(),
        _buildGoogleMap(context),
  //      _zoomminusfunction(),
    //    _zoomplusfunction(),
      ],
    ),
  ),
    );
  }

  getUserLocation() async {
    markers.values.forEach((value) async {
  print(value.position);
  setState(() {
    Provider.of<Contentrovider>(context, listen: false).changeData(value.position.toString()) ;
        locationPosition =value.position;

  });
 
    Navigator.of(context).pop();
    });
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
      icon: Icon(Icons.remove, color: Color(0xff008080)),
      onPressed: () {
        zoomVal--;
        _minus(zoomVal);
      }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
      icon: Icon(Icons.add, color: Color(0xff008080)),
      onPressed: () {
        zoomVal++;
        _plus(zoomVal);
      }),
    );
  }

  Future<void> _minus(double zoomVal) async {
final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
    CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
    CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }


  Widget _buildGoogleMap(BuildContext context) {
    return Container(
  height: MediaQuery.of(context).size.height,
  width: MediaQuery.of(context).size.width,
  child: GoogleMap(
    myLocationEnabled: true,
    myLocationButtonEnabled: true,

    mapType: MapType.normal,
    initialCameraPosition:
        CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
    onMapCreated: (GoogleMapController controller) {
      _controller.complete(controller);
    },
    markers: Set<Marker>.of(markers.values),
    onTap: (LatLng latLng) {
      // creating a new MARKER
      final MarkerId markerId = MarkerId('4544');
      final Marker marker = Marker(
        markerId: markerId,
        position: latLng,
      );

      setState(() {
        markers.clear();
        // adding a new marker to map
        markers[markerId] = marker;
      });
    },
  ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(position.latitude, position.longitude),
      zoom: 19.151926040649414);
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
  
  Widget _searchbar() {
return Positioned(
  top: 50.0,
  right: 15.0,
  left: 15.0,
  child: Container(
    height: 50.0,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), color: Colors.white),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Enter Address',
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          //onPressed: searchandNavigate,
          onPressed: () {},
          iconSize: 30.0,
        ),
      ),
      onChanged: (val) {
        setState(() {
          // searchAddr = val;
        });
      },
    ),
  ),
    );
 }
}