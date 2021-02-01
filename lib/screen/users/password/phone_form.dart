import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/users/password/verify_form.dart';
import 'package:pakasep/utility/style.dart';

class PhoneForm extends StatefulWidget {
  const PhoneForm({Key key}) : super(key: key);
  @override
  _PhoneFormState createState() => _PhoneFormState();
}

class _PhoneFormState extends State<PhoneForm> {
  String _telepon;

  Widget _buildTelepon() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nomor telepon tidak boleh kosong';
        }
      },
      onSaved: (String value) {
        _telepon = value;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Nomor Telepon',
        labelText: 'Nomor Telepon',
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
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackOnlyAppbar(child: null),
              Container(
                height: size.height - 115,
                padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AutoSizeText(
                        'Lupa Kata Sandi?',
                        textAlign: TextAlign.center,
                        style: title900Dark,
                        maxLines: 1,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AutoSizeText(
                            'Masukkan Nomor Handphone',
                            textAlign: TextAlign.center,
                            style: title600Dark,
                            maxLines: 1,
                          ),
                          AutoSizeText(
                            'Kode verifikasi akan muncul di nomor handphone  yang terdaftar',
                            textAlign: TextAlign.center,
                            style: subtitle600Light2,
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          _buildTelepon(),
                          SizedBox(
                            height: 25.0,
                          ),
                          FlatButton(
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }
                              _formKey.currentState.save();
                              print(_telepon);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VerifyCodeForm()),
                              );
                            },
                            height: 60,
                            minWidth: size.width,
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'KIRIM',
                              style: buttonTextLight,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1,
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
