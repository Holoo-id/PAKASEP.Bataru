import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/intro.dart';
import 'package:pakasep/utility/typhography.dart';

class EditProfilForm extends StatefulWidget {
  const EditProfilForm({Key key}) : super(key: key);
  @override
  _EditProfilFormState createState() => _EditProfilFormState();
}

class _EditProfilFormState extends State<EditProfilForm> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String _userId,
      _namaLengkap,
      _kataSandi,
      _npwp,
      _tempatLahir,
      _tanggalLahir,
      _alamat;
  String _telepon = "89012345678";

  Icon namaIcon = new Icon(null);
  Icon tempatLahirIcon = new Icon(null);
  Icon tanggalLahirIcon = new Icon(null);
  Icon alamatIcon = new Icon(null);
  Icon passIcon = new Icon(null);
  Icon npwpIcon = new Icon(null);
  Icon teleponIcon = new Icon(null);

  Widget _buildNamaLengkap() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      validator: (String namaLengkap) {
        if (namaLengkap.isEmpty) {
          return 'Nama lengkap harus diisi';
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

  Widget _buildKataSandi() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (String kataSandi) {
        if (kataSandi.isEmpty) {
          return 'Kata sandi harus diisi';
        }
        if (kataSandi.length < 5) {
          return 'Kata sandi terlalu pendek';
        }
        // if (!RegExp(r"^(?=.*?[0-9])$").hasMatch(value)) {
        //   return 'Setidaknya terdapat 1 digit angka';
        // }
      },
      onChanged: (kataSandi) {
        if (kataSandi.length > 5) {
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
        _kataSandi = kataSandi;
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
        prefixText: '+62 ',
        prefixStyle: text600Dark,
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
        hintText: 'Kota Kelahiran',
        labelText: 'Tempat',
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
            hintText: 'Tanggal Kelahiran',
            labelText: 'Tanggal Lahir',
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 75,
        toolbarHeight: 65,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Platform.isIOS
            ? Container(
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
              )
            : Container(height: 0, width: 0),
        actions: [
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Intro()),
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
      body: Background(
        child: Form(
          key: _formKey,
          child: Container(
            height: size.height,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: FractionallySizedBox(
                      widthFactor: 0.92,
                      child: AutoSizeText(
                        'Data Diri',
                        textAlign: TextAlign.center,
                        style: title900Dark,
                        presetFontSizes: [28, 25, 20, 15, 10, 5],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/p1.png'),
                      radius: 40,
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildNpwp(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildNamaLengkap(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildTempatLahir(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildTanggalLahir(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildAlamat(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildKataSandi(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildTelepon(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
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
                        // maxLines: 3,
                        textAlign: TextAlign.center,
                        presetFontSizes: [14, 10.5, 7],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextButton(
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        } else {
                          _formKey.currentState.save();
                          print(_namaLengkap);
                          print(_kataSandi);
                          print(_npwp);
                          print(_telepon);
                          print(_tempatLahir);
                          print(_tanggalLahir);
                          print(_alamat);

                          // Buat logout
                          // DocumentReference docRefToCurUser = FirebaseFirestore
                          //     .instance
                          //     .collection("Pengguna")
                          //     .doc(_userId);
                          // Buat logout

                        }
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size(size.width, 60),
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'SIMPAN',
                        style: buttonTextLight,
                      ),
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

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021, 1),
        lastDate: DateTime(2200));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateController.text = date;
      });
  }

  _getUserData() async {
    _userId = FirebaseAuth.instance.currentUser.uid;
    DocumentSnapshot docSnapToUser =
        await _firestore.collection("Pengguna").doc(_userId).get();
    _namaLengkap = docSnapToUser.data()["Nama Lengkap"];
    _tanggalLahir = docSnapToUser.data()["Tanggal Lahir"];
    _npwp = docSnapToUser.data()["NPWP"];
    _alamat = docSnapToUser.data()["Alamat"];
    _tempatLahir = docSnapToUser.data()["Tempat Lahir"];
    _telepon = docSnapToUser.data()["Telepon"];
  }

  @override
  void initState() {
    _getUserData();
    super.initState();
  }
}
