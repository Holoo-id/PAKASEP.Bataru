import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/users/login/login_form.dart';
import 'package:pakasep/utility/typhography.dart';

class NewPasswordComplete extends StatefulWidget {
  @override
  _NewPasswordCompleteState createState() => _NewPasswordCompleteState();
}

class _NewPasswordCompleteState extends State<NewPasswordComplete> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WaveBackground(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AutoSizeText(
                'Selesai!',
                style: title600Dark,
                presetFontSizes: [25, 20, 15, 10, 5],
              ),
              AutoSizeText(
                'Kata sandi telah dirubah\nSilahkan masuk ke aplikasi',
                textAlign: TextAlign.center,
                style: subtitle600Light2,
                presetFontSizes: [16, 15, 10, 5],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                  );
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(size.width, 60),
                  primary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: AutoSizeText(
                  'MASUK',
                  presetFontSizes: [14, 10, 5],
                  style: buttonTextLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
