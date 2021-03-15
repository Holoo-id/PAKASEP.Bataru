import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/users/password/new_password_form.dart';
import 'package:pakasep/utility/typhography.dart';

class VerifyCodeForm extends StatefulWidget {
  const VerifyCodeForm({Key key}) : super(key: key);
  @override
  _VerifyCodeFormState createState() => _VerifyCodeFormState();
}

class _VerifyCodeFormState extends State<VerifyCodeForm> {
  String _kodeVerifikasi;

  Widget _buildKodeVerifikasi() {
    return TextFormField(
      validator: (String value) {
        if (value.isEmpty) {
          return 'Kode Verifikasi tidak boleh kosong';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        _kodeVerifikasi = value;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Kode Verifikasi',
        labelText: 'Kode Verifikasi',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      AutoSizeText(
                        'Masukkan Kode Verifikasi',
                        textAlign: TextAlign.center,
                        style: title600Dark,
                        presetFontSizes: [23, 20, 15, 10, 5],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: AutoSizeText(
                          'Kode verifikasi dikirim via SMS digunakan untuk mengubah password',
                          textAlign: TextAlign.center,
                          style: subtitle600Light2,
                          presetFontSizes: [16, 15, 10, 5],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: _buildKodeVerifikasi(),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          print(_kodeVerifikasi);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewPasswordForm()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
