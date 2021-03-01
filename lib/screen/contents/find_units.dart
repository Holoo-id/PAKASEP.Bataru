import 'dart:async';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/utility/style.dart';

class FindUnits extends StatefulWidget {
  // Position current;
  // FindUnits({Key key, this.current}) : super(key: key);
  @override
  _FindUnitsState createState() => _FindUnitsState();
}

class _FindUnitsState extends State<FindUnits> {
  BitmapDescriptor _markerIcon;
  GoogleMapController _mapControl;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Position currentPosition;
  double _lat, _lng;

  void _getUserLocation() async {
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();
    currentPosition = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    print(currentPosition.latitude);
    print(currentPosition.longitude);
    setState(() {
      _lat = currentPosition.latitude;
      _lng = currentPosition.longitude;
    });
  }

  void myMarker(specify, specifyId) async {
    var _markValue = specifyId;
    final MarkerId _markId = MarkerId(_markValue);
    final Marker marker = Marker(
      markerId: _markId,
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
      position:
          LatLng(specify['geolokasi'].latitude, specify['geolokasi'].longitude),
      infoWindow: InfoWindow(
        title: specify["nama_tempat"],
        snippet: 'Ini Jaraknya',
      ),
    );
    setState(() {
      markers[_markId] = marker;
    });
  }

  getMarkerData() async {
    FirebaseFirestore.instance.collection('Rumah').get().then((dataRumah) {
      if (dataRumah.docs.isNotEmpty) {
        for (var i = 0; i < dataRumah.docs.length; i++) {
          myMarker(dataRumah.docs[i].data, dataRumah.docs[i].id);
        }
      }
    });
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'images/location_pin.png');
  }

  @override
  void initState() {
    _getUserLocation();
    getMarkerData();
    _setMarkerIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _buildGoogleMap() {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            _mapControl = controller;
          },
          initialCameraPosition: CameraPosition(
            zoom: 25,
            target: LatLng(_lat, _lng),
          ),
          markers: Set<Marker>.of(markers.values),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(),
          Column(
            children: [
              BackOnlyAppbar(
                child: null,
              ),
              Form(
                child: Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Harga Rumah',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(0),
                      icon: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
