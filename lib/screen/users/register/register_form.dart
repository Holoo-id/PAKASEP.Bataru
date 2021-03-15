import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/users/register/already_registered.dart';
import 'package:pakasep/screen/users/register/ktp_photo_page.dart';
import 'package:pakasep/utility/typhography.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String _alamat,
      _email,
      _kataSandi,
      _ktp,
      _namaLengkap,
      _npwp,
      _tanggalLahir,
      _telepon,
      _tempatLahir;
  Map<String, dynamic> _registeringUserData;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Icon namaIcon = new Icon(null);
  Icon passIcon = new Icon(null);
  Icon passwordIcon = new Icon(null);
  Icon ktpIcon = new Icon(null);
  Icon konKtpIcon = new Icon(null);
  Icon npwpIcon = new Icon(null);
  Icon teleponIcon = new Icon(null);
  Icon alamatIcon = new Icon(null);
  Icon tempatLahirIcon = new Icon(null);
  Icon tanggalLahirIcon = new Icon(null);
  Icon emailIcon = new Icon(null);

  Widget _buildNamaLengkap() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      validator: (String namaLengkap) {
        if (namaLengkap.isEmpty) {
          return 'Nama lengkap harus diisi';
        } else {
          return null;
        }
      },
      onChanged: (namaLengkap) {
        if (namaLengkap.isEmpty) {
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
      onSaved: (String namaLengkap) {
        _namaLengkap = namaLengkap;
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

  Widget _buildTempatLahir() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      validator: (String tempatLahir) {
        if (tempatLahir.isEmpty) {
          return 'Tempat Lahir harus diisi';
        } else {
          return null;
        }
      },
      onChanged: (tempatLahir) {
        if (tempatLahir.isEmpty) {
          setState(() {
            tempatLahirIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        } else {
          setState(() {
            tempatLahirIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        }
      },
      onSaved: (String tempatLahir) {
        _tempatLahir = tempatLahir;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Tempat Lahir',
        labelText: 'Tempat Lahir',
        labelStyle: form400Light,
        filled: true,
        suffixIcon: tempatLahirIcon,
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

  Widget _buildTanggalLahir() {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.datetime,
          controller: _dateController,
          validator: (String tanggalLahir) {
            if (tanggalLahir.isEmpty) {
              return 'Tanggal Lahir harus diisi';
            } else {
              return null;
            }
          },
          onChanged: (tanggalLahir) {
            if (tanggalLahir.isEmpty) {
              setState(() {
                tanggalLahirIcon = new Icon(
                  Icons.error,
                  color: Colors.red,
                );
              });
            } else {
              setState(() {
                tanggalLahirIcon = new Icon(
                  Icons.check,
                  color: Colors.green,
                );
              });
            }
          },
          onSaved: (String tanggalLahir) {
            _tanggalLahir = tanggalLahir;
          },
          style: form200Light,
          decoration: InputDecoration(
            hintText: 'Tanggal Lahir',
            labelText: 'Tanggal Lahir',
            labelStyle: form400Light,
            filled: true,
            suffixIcon: tanggalLahirIcon,
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
        ),
      ),
    );
  }

  Widget _buildAlamat() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.multiline,
      minLines: 2,
      maxLines: 5,
      validator: (String alamat) {
        if (alamat.isEmpty) {
          return 'Alamat harus diisi';
        } else {
          return null;
        }
      },
      onChanged: (alamat) {
        if (alamat.isEmpty) {
          setState(() {
            alamatIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        } else {
          setState(() {
            alamatIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        }
      },
      onSaved: (String alamat) {
        _alamat = alamat;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Alamat Sesuai KTP',
        labelText: 'Alamat',
        labelStyle: form400Light,
        filled: true,
        suffixIcon: alamatIcon,
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
      validator: (String kataSandi) {
        if (kataSandi.isEmpty) {
          return 'Kata sandi harus diisi';
        } else {
          if (kataSandi.length < 5) {
            return 'Kata sandi terlalu pendek';
          } else {
            if (!RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])\w{5,}$')
                .hasMatch(kataSandi)) {
              return 'Harus terdapat angka dan alfabet';
            } else {
              return null;
            }
          }
        }
      },
      onChanged: (kataSandi) {
        if (!RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])\w{5,}$').hasMatch(kataSandi)) {
          setState(() {
            passIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        } else {
          setState(() {
            passIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        }
        _kataSandi = kataSandi;
      },
      style: form200Light,
      decoration: InputDecoration(
          hintText: 'Harus Memuat Angka dan Huruf',
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
        } else {
          if (password != _kataSandi) {
            return 'Konfirmasi kata sandi tidak sama';
          } else {
            return null;
          }
        }
      },
      onSaved: (String password) {
        _kataSandi = password;
      },
      style: form200Light,
      decoration: InputDecoration(
          hintText: 'Masukkan Kata Sandi Kembali',
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
        } else {
          if (ktp.length < 16) {
            return 'Harus diisi 16 digit Nomor KTP';
          } else {
            return null;
          }
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
        hintText: '16 Digit Nomor KTP Anda',
        labelText: 'Nomor KTP',
        counterText: '',
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
        } else {
          return null;
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
        counterText: '',
        hintText: 'Masukkan 16 Digit Nomor KTP Anda Kembali',
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
          } else {
            return null;
          }
        } else {
          return null;
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
        counterText: '',
        hintText: 'Boleh Tidak Diisi (Opsional)',
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
          return 'Nomor Telepon Harus Diisi';
        } else {
          return null;
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
        hintText: 'Masukkan Tanpa Angka 0 Di Depan',
        labelText: 'Nomor Telepon',
        labelStyle: form400Light,
        filled: true,
        fillColor: Color(0xffF2F3F7),
        prefixText: '+62 ',
        prefixStyle: text600Dark,
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

  Widget _buildEmail() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      validator: (String email) {
        if (email.isEmpty) {
          return 'Email Harus Diisi';
        } else {
          // VALIDATOR EMAIL
          if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(email)) {
            return 'Email Tidak Valid';
          } else {
            return null;
          }
        }
      },
      onChanged: (email) {
        if (email.isEmpty) {
          setState(() {
            emailIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        }
        if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(email)) {
          setState(() {
            emailIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        } else {
          setState(() {
            emailIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
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
        suffixIcon: emailIcon,
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
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 65),
        child: BackOnlyAppbar(
          child: null,
        ),
      ),
      body: Background(
        child: Container(
          height: size.height,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                    child: AutoSizeText(
                      'Isi Data Diri',
                      textAlign: TextAlign.center,
                      style: title900Dark,
                      presetFontSizes: [28, 25, 20, 15, 10, 5],
                    ),
                  ),
                  _buildTelepon(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildNamaLengkap(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildTempatLahir(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildTanggalLahir(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildAlamat(),
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
                  _buildEmail(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildKataSandi(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildKonfirmasiKataSandi(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => _setAgreedToTOS(!_agreedToTOS),
                        child: const AutoSizeText(
                          'Saya Setuju Untuk Mendaftarkan Diri',
                          presetFontSizes: [9, 6.75, 4.5],
                          maxLines: 1,
                        ),
                      ),
                      Checkbox(
                        value: _agreedToTOS,
                        onChanged: _setAgreedToTOS,
                        activeColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: _submitable()
                        ? () async {
                            if (!_formKey.currentState.validate()) {
                              return this;
                            } else {
                              _formKey.currentState.save();
                              print(_namaLengkap);
                              print(_kataSandi);
                              print(_ktp);
                              print(_npwp);
                              print(_telepon);
                              print(_alamat);
                              print(_tanggalLahir);
                              print(_tempatLahir);
                              print(_email);
                              CollectionReference _searchUser =
                                  _firestore.collection("Pengguna");
                              QuerySnapshot _userHavingSameKTP =
                                  await _searchUser
                                      .where("KTP", isEqualTo: _ktp)
                                      .get();
                              QuerySnapshot _userHavingSameTelepon =
                                  await _searchUser
                                      .where("Telepon", isEqualTo: _telepon)
                                      .get();
                              QuerySnapshot _userHavingSameEmail =
                                  await _searchUser
                                      .where("Email", isEqualTo: _email)
                                      .get();
                              if (_userHavingSameTelepon.docs.length > 0 ||
                                  _userHavingSameKTP.docs.length > 0 ||
                                  _userHavingSameEmail.docs.length > 0) {
                                return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AlreadyRegistered()),
                                );
                              } else {
                                _registeringUserData = {
                                  "Nama Lengkap": _namaLengkap.trim(),
                                  "Kata Sandi": _kataSandi.trim(),
                                  "KTP": _ktp.trim(),
                                  "NPWP": _npwp.trim(),
                                  "Email": _email.trim(),
                                  "Telepon": _telepon.trim(),
                                  "Alamat": _alamat.trim(),
                                  "Tempat Lahir": _tempatLahir.trim(),
                                  "Tanggal Lahir": _tanggalLahir.trim()
                                };
                                return Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => KtpPhotoPage(
                                          userData: _registeringUserData)),
                                );
                              }
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width, 60),
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'LANJUTKAN',
                      style: buttonTextLight,
                    ),
                  ),
                ],
              ),
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

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateController.text = date;
      });
  }
}
