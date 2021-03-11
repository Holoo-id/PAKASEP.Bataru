import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/users/password/verify_form.dart';
import 'package:pakasep/utility/typhography.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({Key key}) : super(key: key);
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  String _email;

  Widget _buildEmail() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      validator: (String email) {
        if (email.isEmpty) {
          return 'Email Harus Diisi';
        }
        // VALIDATOR EMAIL
        if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(email)) {
          return 'Email Tidak Valid';
        }
      },
      onSaved: (String email) {
        _email = email;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'emailanda@contoh.com',
        labelText: 'E-Mail',
        labelStyle: form400Light,
        filled: true,
        fillColor: Color(0xffF2F3F7),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 65),
        child: BackOnlyAppbar(
          child: null,
        ),
      ),
      body: Background(
        child: Container(
          alignment: Alignment.center,
          height: size.height,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: AutoSizeText(
                      'Lupa Kata Sandi?',
                      textAlign: TextAlign.center,
                      style: title900Dark,
                      presetFontSizes: [28, 25, 20, 15, 10, 5],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AutoSizeText(
                        'Masukkan Alamat E-mail',
                        textAlign: TextAlign.center,
                        style: title600Dark,
                        presetFontSizes: [23, 20, 15, 10, 5],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: AutoSizeText(
                          'Kode verifikasi akan muncul di nomor handphone  yang terdaftar',
                          textAlign: TextAlign.center,
                          style: subtitle600Light2,
                          presetFontSizes: [16, 15, 10, 5],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: _buildEmail(),
                      ),
                      TextButton(
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          print(_email);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyCodeForm()),
                          );
                        },
                        style: TextButton.styleFrom(
                          minimumSize: Size(size.width, 60),
                          primary: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'KIRIM',
                          style: buttonTextLight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
