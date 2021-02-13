import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/wave_background.dart';
import 'package:pakasep/screen/users/login/login_form.dart';
import 'package:pakasep/utility/style.dart';

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
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Selesai!',
                style: title600Dark,
              ),
              Text(
                'Kata sandi telah dirubah\nSilahkan masuk ke aplikasi',
                textAlign: TextAlign.center,
                style: subtitle600Light2,
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                height: 60,
                minWidth: size.width,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                  );
                },
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'MASUK',
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
