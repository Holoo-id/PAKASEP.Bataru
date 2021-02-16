class UserLogged{
  final String id;
  final String nik;
  final String nama;
  final String status;

  UserLogged({this.id, this.nama, this.nik, this.status});

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "id" : id,
      "nik" : nik,
      "nama" : nama,
      "status" : status
    };
  }
}