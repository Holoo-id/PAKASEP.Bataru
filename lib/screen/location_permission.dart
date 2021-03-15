import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/intro.dart';
import 'package:pakasep/utility/typhography.dart';

class LocationPermission extends StatefulWidget {
  @override
  _LocationPermissionState createState() => _LocationPermissionState();
}

class _LocationPermissionState extends State<LocationPermission> {
  void _getUserLocation() async {
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
    GeolocationStatus geolocationStatus =
        await geolocator.checkGeolocationPermissionStatus();
    Position currentPosition = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WaveBackground(
        child: Center(
          heightFactor: 1,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  'Akses Lokasi',
                  style: title600Dark,
                  presetFontSizes: [25, 20, 15, 10, 5],
                ),
                AutoSizeText(
                  'Aktifkan setting lokasi di handphone anda sebelum mulai',
                  textAlign: TextAlign.center,
                  style: subtitle600Light2,
                  presetFontSizes: [16, 15, 10, 5],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _getUserLocation();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Intro()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width, 60),
                      onSurface: Colors.white,
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'AKTIFKAN',
                      style: buttonTextLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
