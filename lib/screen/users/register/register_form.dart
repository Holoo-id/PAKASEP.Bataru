import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/users/register/already_registered.dart';
import 'package:pakasep/screen/users/register/image_approval.dart';
import 'package:pakasep/screen/users/register/ktp_photo_page.dart';
import 'package:pakasep/utility/style.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String _namaLengkap;
  String _kataSandi;
  String _ktp;
  String _npwp;
  String _telepon;

  Icon namaIcon = new Icon(null);
  Icon passIcon = new Icon(null);
  Icon passwordIcon = new Icon(null);
  Icon ktpIcon = new Icon(null);
  Icon konKtpIcon = new Icon(null);
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

  Widget _buildKonfirmasiKataSandi() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      onChanged: (password) {
        if (password == _kataSandi) {
          setState(() {
            passwordIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        } else {
          setState(() {
            passwordIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        }
      },
      validator: (String password) {
        if (password.isEmpty) {
          return 'Konfirmasi kata sandi harus diisi';
        }
        if (password != _kataSandi) {
          return 'Konfirmasi kata sandi tidak sama';
        }
      },
      onSaved: (String password) {
        _kataSandi = password;
      },
      style: form200Light,
      decoration: InputDecoration(
          hintText: 'Kata Sandi',
          labelText: 'Konfirmasi Kata Sandi',
          labelStyle: form400Light,
          filled: true,
          fillColor: Color(0xffF2F3F7),
          suffixIcon: passwordIcon,
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

  Widget _buildKtp() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      maxLength: 16,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (String ktp) {
        if (ktp.isEmpty) {
          return 'Nomor KTP harus diisi';
        }
        if (ktp.length < 16) {
          return 'Harus diisi 16 digit Nomor KTP';
        }
      },
      onChanged: (ktp) {
        if (ktp.isEmpty) {
          setState(() {
            ktpIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        } else {
          setState(() {
            ktpIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        }
        _ktp = ktp;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Nomor KTP (16 Digit)',
        labelText: 'Nomor KTP',
        labelStyle: form400Light,
        filled: true,
        fillColor: Color(0xffF2F3F7),
        suffixIcon: ktpIcon,
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

  Widget _buildKonfirmasiKtp() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      maxLength: 16,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (String konKtp) {
        if (konKtp != _ktp) {
          return 'Konfirmasi nomor KTP tidak sama';
        }
      },
      onChanged: (konKtp) {
        if (konKtp == _ktp) {
          setState(() {
            konKtpIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        } else {
          setState(() {
            konKtpIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        }
      },
      onSaved: (String konKtp) {
        _ktp = konKtp;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Nomor KTP (16 Digit)',
        labelText: 'Konfirmasi Nomor KTP',
        labelStyle: form400Light,
        filled: true,
        fillColor: Color(0xffF2F3F7),
        suffixIcon: konKtpIcon,
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
          if(npwp.length < 15) {
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
        padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
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
                SizedBox(
                  height: 7.5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Isi Data Diri',
                      textAlign: TextAlign.center,
                      style: title900Dark,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    _buildNamaLengkap(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildKataSandi(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildKonfirmasiKataSandi(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildKtp(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildKonfirmasiKtp(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildNpwp(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildTelepon(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => _setAgreedToTOS(!_agreedToTOS),
                          child: const AutoSizeText(
                            'Saya Setuju dengan Syarat dan Ketentuan',
                            presetFontSizes: [9, 6.75, 4.5],
                            maxLines: 1,
                          ),
                        ),
                        Checkbox(
                          value: _agreedToTOS,
                          onChanged: _setAgreedToTOS,
                        ),
                      ],
                    ),
                    FlatButton(
                      onPressed: _submitable()
                          ? () {
                              if (!_formKey.currentState.validate()) {
                                return this;
                              } else {
                                _formKey.currentState.save();
                                print(_namaLengkap);
                                print(_kataSandi);
                                print(_ktp);
                                print(_npwp);
                                print(_telepon);
                                if (_ktp == '1234567890123456') {
                                  return Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AlreadyRegistered()),
                                  );
                                } else {
                                  return Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KtpPhotoPage()),
                                  );
                                }
                              }
                            }
                          : null,
                      height: 60,
                      minWidth: size.width,
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'LANJUTKAN',
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
    );
  }

  bool _submitable() {
    return _agreedToTOS;
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }
}
