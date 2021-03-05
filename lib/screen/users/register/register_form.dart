import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/back_only_appbar.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/users/register/already_registered.dart';
import 'package:pakasep/screen/users/register/ktp_photo_page.dart';
import 'package:pakasep/utility/style.dart';

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

  Widget _buildTempatLahir() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      validator: (String tempat_lahir) {
        if (tempat_lahir.isEmpty) {
          return 'Tempat Lahir harus diisi';
        }
      },
      onChanged: (tempat_lahir) {
        if (tempat_lahir.isEmpty) {
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
      onSaved: (String tempat_lahir) {
        _tempatLahir = tempat_lahir;
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
          validator: (String tanggal_lahir) {
            if (tanggal_lahir.isEmpty) {
              return 'Tanggal Lahir harus diisi';
            }
          },
          onChanged: (tanggal_lahir) {
            if (tanggal_lahir.isEmpty) {
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
          onSaved: (String tanggal_lahir) {
            _tanggalLahir = tanggal_lahir;
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
        hintText: 'Alamat',
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
      validator: (String kata_sandi) {
        if (kata_sandi.isEmpty) {
          return 'Kata sandi harus diisi';
        }
        if (kata_sandi.length < 5) {
          return 'Kata sandi terlalu pendek';
        }
        if (!RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])\w{5,}$')
            .hasMatch(kata_sandi)) {
          return 'Harus terdapat angka dan alfabet';
        }
      },
      onChanged: (kata_sandi) {
        if (!RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])\w{5,}$')
            .hasMatch(kata_sandi)) {
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
        // VALIDATOR EMAIL
        // if (!RegExp(
        //         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        //     .hasMatch(telepon)) {
        //   return 'Email Tidak Valid';
        // }
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
        hintText: '89012345678',
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
          return 'Email tidak boleh kosong';
        }
        // VALIDATOR EMAIL
        if (!RegExp(
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(email)) {
          return 'Email Tidak Valid';
        }
      },
      onChanged: (email) {
        if (email.isNotEmpty) {
          if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(email)) {
            setState(() {
              emailIcon = new Icon(
                Icons.check,
                color: Colors.green,
              );
            });
          } else {
            setState(() {
              emailIcon = new Icon(
                Icons.error,
                color: Colors.red,
              );
            });
          }
        } else {
          setState(() {
            emailIcon = new Icon(
              Icons.error,
              color: Colors.red,
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
      extendBodyBehindAppBar: true,
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
            // height: size.height,
            padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
            child: Form(
              key: _formKey,
              child: Column(
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
                    height: 10,
                  ),
                  _buildAlamat(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildTempatLahir(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildTanggalLahir(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildEmail(),
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
                        activeColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  FlatButton(
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
                              if (_userHavingSameTelepon.docs.length > 0 ||
                                  _userHavingSameKTP.docs.length > 0) {
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
