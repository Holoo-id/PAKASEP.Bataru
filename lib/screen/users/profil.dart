import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/users/login/login_form.dart';
import 'package:pakasep/utility/style.dart';

class EditProfilForm extends StatefulWidget {
  const EditProfilForm({Key key}) : super(key: key);
  @override
  _EditProfilFormState createState() => _EditProfilFormState();
}

class _EditProfilFormState extends State<EditProfilForm> {
  String _namaLengkap;
  String _kataSandi;
  String _npwp;
  String _telepon = "085213011011";

  Icon namaIcon = new Icon(null);
  Icon passIcon = new Icon(null);
  Icon npwpIcon = new Icon(null);
  Icon teleponIcon = new Icon(null);

  Widget _buildNamaLengkap() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      validator: (String nama_lengkap) {
        if (nama_lengkap.isEmpty) {
          return 'Nama lengkap harus diisi';
        }
      },
      onChanged: (nama_lengkap) {
        if (nama_lengkap.isEmpty) {
          setState(() {
            namaIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        } else {
          setState(() {
            namaIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        }
      },
      onSaved: (String nama_lengkap) {
        _namaLengkap = nama_lengkap;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Nama Lengkap (Sesuai KTP)',
        labelText: 'Nama Lengkap',
        labelStyle: form400Light,
        filled: true,
        suffixIcon: namaIcon,
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

  Widget _buildKataSandi() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (String kata_sandi) {
        if (kata_sandi.isEmpty) {
          return 'Kata sandi harus diisi';
        }
        if (kata_sandi.length < 5) {
          return 'Kata sandi terlalu pendek';
        }
        // if (!RegExp(r"^(?=.*?[0-9])$").hasMatch(value)) {
        //   return 'Setidaknya terdapat 1 digit angka';
        // }
      },
      onChanged: (kata_sandi) {
        if (kata_sandi.length > 5) {
          setState(() {
            passIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        } else {
          setState(() {
            passIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        }
        _kataSandi = kata_sandi;
      },
      style: form200Light,
      decoration: InputDecoration(
          hintText: 'Kata Sandi',
          labelText: 'Kata Sandi',
          labelStyle: form400Light,
          filled: true,
          fillColor: Color(0xffF2F3F7),
          suffixIcon: passIcon,
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
          )),
    );
  }

  Widget _buildNpwp() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      maxLength: 15,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (String npwp) {
        if (npwp.isNotEmpty) {
          if (npwp.length < 15) {
            return 'Harus diisi 15 digit Nomor NPWP atau boleh kosong';
          }
        }
      },
      onChanged: (npwp) {
        if (npwp.isNotEmpty) {
          if (npwp.length < 15) {
            setState(() {
              npwpIcon = new Icon(
                Icons.error,
                color: Colors.red,
              );
            });
          } else {
            setState(() {
              npwpIcon = new Icon(
                Icons.check,
                color: Colors.green,
              );
            });
          }
        } else {
          setState(() {
            npwpIcon = new Icon(null);
          });
        }
      },
      onSaved: (String value) {
        _npwp = value;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Nomor NPWP (15 Digit)',
        labelText: 'Nomor NPWP',
        labelStyle: form400Light,
        filled: true,
        fillColor: Color(0xffF2F3F7),
        suffixIcon: npwpIcon,
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

  Widget _buildTelepon() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.phone,
      enabled: false,
      initialValue: _telepon,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (String telepon) {
        if (telepon.isEmpty) {
          return 'Nomor telepon tidak boleh kosong';
        }
      },
      onChanged: (telepon) {
        if (telepon.isEmpty) {
          setState(() {
            teleponIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        } else {
          setState(() {
            teleponIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        }
      },
      onSaved: (String telepon) {
        _telepon = telepon;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Nomor Telepon',
        labelText: 'Nomor Telepon',
        labelStyle: form400Light,
        filled: true,
        fillColor: Color(0xffF2F3F7),
        suffixIcon: teleponIcon,
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
  bool _agreedToTOS = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                leadingWidth: 75,
                toolbarHeight: 65,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
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
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginForm()),
                      );
                    },
                    child: Text(
                      'logout',
                      style: TextStyle(
                        height: 1.08,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        color: Color(0xffF05D48),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: size.height - 115,
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Data Diri',
                        textAlign: TextAlign.center,
                        style: title900Dark,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('images/p1.png'),
                        radius: 40,
                      ),
                      _buildNpwp(),
                      _buildNamaLengkap(),
                      _buildKataSandi(),
                      _buildTelepon(),
                      Container(
                        width: size.width * 0.75,
                        child: AutoSizeText.rich(
                          TextSpan(
                            style: text500Grey,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Anda hanya diizinkan mengganti ',
                              ),
                              TextSpan(
                                text: 'KATA SANDI ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'dan ',
                              ),
                              TextSpan(
                                text: 'NOMOR HANDPHONE ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'saja. Klik ',
                              ),
                              TextSpan(
                                text: 'SIMPAN ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'jika sudah selesai.',
                              ),
                            ],
                          ),
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          presetFontSizes: [14, 10.5, 7],
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          } else {
                            _formKey.currentState.save();
                            print(_namaLengkap);
                            print(_kataSandi);
                            print(_npwp);
                            print(_telepon);
                          }
                        },
                        height: 60,
                        minWidth: size.width,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'SIMPAN',
                          style: buttonTextLight,
                        ),
                      ),
                      SizedBox(
                        height: 70,
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
