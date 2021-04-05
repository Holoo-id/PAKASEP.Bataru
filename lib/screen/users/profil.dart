import 'dart:io' show Platform;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakasep/screen/components/background.dart';
import 'package:pakasep/screen/components/popup_with_button.dart';
import 'package:pakasep/screen/home.dart';
import 'package:pakasep/screen/intro.dart';
import 'package:pakasep/utility/typhography.dart';

class EditProfilForm extends StatefulWidget {
  const EditProfilForm({Key key}) : super(key: key);
  @override
  _EditProfilFormState createState() => _EditProfilFormState();
}

class _EditProfilFormState extends State<EditProfilForm> {
  bool _disable = true;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String _userId,
      _namaLengkap,
      _email,
      _kataSandi,
      _npwp,
      _tempatLahir,
      _tanggalLahir,
      _alamat,
      _kecamatan,
      _kelurahan,
      _kodePos,
      _kota,
      _ktp,
      _tempatKerja,
      _telepon;

  Icon namaIcon = new Icon(null);
  Icon tempatLahirIcon = new Icon(null);
  Icon tanggalLahirIcon = new Icon(null);
  Icon alamatIcon = new Icon(null);
  Icon kelurahanIcon = new Icon(null);
  Icon kecamatanIcon = new Icon(null);
  Icon kotaIcon = new Icon(null);
  Icon posIcon = new Icon(null);
  Icon passIcon = new Icon(null);
  Icon npwpIcon = new Icon(null);
  Icon teleponIcon = new Icon(null);
  Icon ktpIcon = new Icon(null);
  Icon tempatKerjaIcon = new Icon(null);
  Icon emailIcon = new Icon(null);

  Widget _buildNamaLengkap() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      readOnly: _disable,
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
            return null;
          }
        }
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
      readOnly: _disable,
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
      // enabled: _enable,
      readOnly: _disable,
      initialValue: _telepon,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (String telepon) {
        if (telepon.isEmpty) {
          return 'Nomor telepon tidak boleh kosong';
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
        hintText: 'Nomor Telepon',
        labelText: 'Nomor Telepon',
        labelStyle: form400Light,
        filled: true,
        fillColor: Color(0xffF2F3F7),
        // suffixIcon: teleponIcon,
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
      readOnly: _disable,
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
          readOnly: _disable,
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
      readOnly: _disable,
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

  Widget _buildKelurahan() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      readOnly: _disable,
      validator: (String kelurahan) {
        if (kelurahan.isEmpty) {
          return 'Kelurahan harus diisi';
        } else {
          return null;
        }
      },
      onChanged: (kelurahan) {
        if (kelurahan.isEmpty) {
          setState(() {
            kelurahanIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        } else {
          setState(() {
            kelurahanIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        }
      },
      onSaved: (String kelurahan) {
        _kelurahan = kelurahan;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Kelurahan',
        labelText: 'Kelurahan',
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

  Widget _buildKecamatan() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      readOnly: _disable,
      validator: (String kecamatan) {
        if (kecamatan.isEmpty) {
          return 'Kecamatan harus diisi';
        } else {
          return null;
        }
      },
      onChanged: (kecamatan) {
        if (kecamatan.isEmpty) {
          setState(() {
            kecamatanIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        } else {
          setState(() {
            kecamatanIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        }
      },
      onSaved: (String kecamatan) {
        _kecamatan = kecamatan;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Kecamatan',
        labelText: 'Kecamatan',
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

  Widget _buildKota() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      readOnly: _disable,
      validator: (String kota) {
        if (kota.isEmpty) {
          return 'Kota / Kabupaten harus diisi';
        } else {
          return null;
        }
      },
      onChanged: (kota) {
        if (kota.isEmpty) {
          setState(() {
            kotaIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        } else {
          setState(() {
            kotaIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        }
      },
      onSaved: (String kota) {
        _kota = kota;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Kabupaten / Kota',
        labelText: 'Kabupaten / Kota',
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

  Widget _buildKodePos() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      maxLength: 5,
      readOnly: _disable,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (String pos) {
        if (pos.isEmpty) {
          return 'Kode Pos harus diisi';
        } else {
          if (pos.length < 5) {
            return 'Harus diisi 5 digit Kode Pos';
          } else {
            return null;
          }
        }
      },
      onChanged: (pos) {
        if (pos.isEmpty) {
          setState(() {
            posIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        } else {
          setState(() {
            posIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        }
        _kodePos = pos;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Kode Pos',
        labelText: 'Kode Pos',
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

  Widget _buildTempatKerja() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.text,
      readOnly: _disable,
      validator: (String tempatLahir) {
        if (tempatLahir.isEmpty) {
          return 'Tempat Bekerja harus diisi';
        } else {
          return null;
        }
      },
      onChanged: (tempatKerja) {
        if (tempatKerja.isEmpty) {
          setState(() {
            tempatKerjaIcon = new Icon(
              Icons.error,
              color: Colors.red,
            );
          });
        } else {
          setState(() {
            tempatKerjaIcon = new Icon(
              Icons.check,
              color: Colors.green,
            );
          });
        }
      },
      onSaved: (String tempatKerja) {
        _tempatKerja = tempatKerja;
      },
      style: form200Light,
      decoration: InputDecoration(
        hintText: 'Instansi Tempat Bekerja',
        labelText: 'Tempat Bekerja',
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

  Widget _buildKtp() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      maxLength: 16,
      readOnly: _disable,
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

  Widget _buildEmail() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      readOnly: _disable,
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
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Intro()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0,
            ),
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
                        child: _buildTelepon(),
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
                        child: _buildKelurahan(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildKecamatan(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildKota(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildKodePos(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildTempatKerja(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildKtp(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildNpwp(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildEmail(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: _buildKataSandi(),
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
                    child: ElevatedButton(
                      onPressed: () {
                        if (_disable == true) {
                          return _disable = !_disable;
                        } else {
                          return null;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width, 60),
                        primary: Theme.of(context).primaryColor,
                        onSurface: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'EDIT',
                        style: buttonTextLight,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_disable == false) {
                          if (!_formKey.currentState.validate()) {
                            return;
                          } else {
                            _formKey.currentState.save();
                            popupWithButton(
                              context,
                              "Simpan Data",
                              "Konfirmasi perubahan Anda yang baru saja dirubah",
                              MaterialPageRoute(
                                  builder: (context) => EditProfilForm()),
                            );
                            print(_namaLengkap);
                            print(_kataSandi);
                            print(_npwp);
                            print(_telepon);
                            print(_tempatLahir);
                            print(_tanggalLahir);
                            print(_alamat);
                            _disable = true;
                          }
                        } else {
                          return null;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(size.width, 60),
                        primary: Theme.of(context).primaryColor,
                        onSurface: Theme.of(context).primaryColor,
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
