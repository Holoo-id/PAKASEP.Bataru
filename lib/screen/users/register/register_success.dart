import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/users/login/login_form.dart';
import 'package:pakasep/utility/style.dart';

class RegisterSuccess extends StatefulWidget {
  @override
  _RegisterSuccessState createState() => _RegisterSuccessState();
}

class _RegisterSuccessState extends State<RegisterSuccess> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WaveBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackOnlyAppbar(child: null),
              Container(
                height: size.height,
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AutoSizeText(
                            'Pendaftaran Berhasil!',
                            textAlign: TextAlign.center,
                            style: title600Dark,
                            maxLines: 1,
                          ),
                          AutoSizeText(
                            'Klik tombol dibawah ini untuk masuk ke aplikasi',
                            textAlign: TextAlign.center,
                            style: subtitle600Light2,
                            maxLines: 2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
