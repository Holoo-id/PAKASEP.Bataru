import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/users/login/login_form.dart';
import 'package:pakasep/utility/style.dart';

class AlreadyRegistered extends StatefulWidget {
  @override
  _AlreadyRegisteredState createState() => _AlreadyRegisteredState();
}

class _AlreadyRegisteredState extends State<AlreadyRegistered> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WaveBackground(
        child: Container(
          height: size.height,
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(color: Color(0xffe5e5e5))),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xff3F414E),
                      size: 30,
                    ),
                  ),
                ),
                Container(
                  height: size.height - 115,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AutoSizeText(
                            'Anda Sudah Terdaftar!',
                            textAlign: TextAlign.center,
                            style: title600Dark,
                            maxLines: 1,
                          ),
                          AutoSizeText(
                            'Tidak perlu mendaftar lagi Silahkan masuk ke aplikasi',
                            textAlign: TextAlign.center,
                            style: subtitle600Light2,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginForm()),
                          );
                        },
                        height: 60,
                        minWidth: size.width,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'MENGERTI',
                          style: buttonTextLight,
                        ),
                      ),
                    ],
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
