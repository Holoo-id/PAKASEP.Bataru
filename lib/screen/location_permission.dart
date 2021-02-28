import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/intro.dart';
import 'package:pakasep/utility/style.dart';
// import 'package:permission_handler/permission_handler.dart';

class LocationPermission extends StatefulWidget {
  @override
  _LocationPermissionState createState() => _LocationPermissionState();
}

class _LocationPermissionState extends State<LocationPermission> {
  // Position _currentPosition;
  String _currentAddress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WaveBackground(
        child: Center(
          // heightFactor: 4.125,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Akses Lokasi',
                  style: title600Dark,
                ),
                AutoSizeText(
                  'Aktifkan setting lokasi di handphone anda sebelum mulai',
                  textAlign: TextAlign.center,
                  style: subtitle600Light2,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 20,
                ),
                // if (_currentPosition != null) Text(_currentAddress),
                FlatButton(
                  height: 60,
                  minWidth: size.width,
                  onPressed: () {
                    // checkLocationPermission();
                    // _getCurrentLocation();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Intro()),
                    );
                  },
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'AKTIFKAN',
                    style: buttonTextLight,
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
