import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/utility/style.dart';

class FindUnits extends StatefulWidget {
  Position current;
  FindUnits({Key key, this.current}) : super(key: key);
  @override
  _FindUnitsState createState() => _FindUnitsState();
}

class _FindUnitsState extends State<FindUnits> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Set<Marker> _markers = HashSet<Marker>();
  Position _current;

  GoogleMapController _mapControl;
  BitmapDescriptor _markerIcon;

  Marker myMarker = Marker(
    markerId: MarkerId('mine'),
    position: LatLng(-6.8644, 107.5797),
    infoWindow: InfoWindow(title: 'Lokasi Saya Sekarang'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  );

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'images/location_pin.png');
  }

  double zoom = 5.0;

  void _onMapCreated(GoogleMapController controller) {
    _mapControl = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: LatLng(-6.8644, 107.5797),
          infoWindow: InfoWindow(
            title: "Holoo Creative",
            snippet: "Media Company",
          ),
          icon: _markerIcon,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic _currentPosition = widget.current;
    _getCurrentLocation() {
      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        setState(() {
          _currentPosition = position;
          _current = position;
          print(_current.latitude);
          print(_current.longitude);
        });

        // _getAddressFromLatLng();
      }).catchError((e) {
        print(e);
      });
    }

    // _getAddressFromLatLng() async {
    //   try {
    //     List<Placemark> p = await geolocator.placemarkFromCoordinates(
    //         _currentPosition.latitude, _currentPosition.longitude);

    //     // _current = p[0];

    //     // setState(() {
    //     //   _current =
    //     //       "${place.locality}, ${place.postalCode}, ${place.country}";
    //     // });
    //   } catch (e) {
    //     print(e);
    //   }
    // }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
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

  _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          zoom: 25,
          target: LatLng(-6.8644, 107.5797),
          // target: LatLng(_current.latitude, _current.longitude),
        ),
        markers: _markers,
      ),
    );
  }
}
