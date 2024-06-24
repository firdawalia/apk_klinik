import 'package:cloud_firestore/cloud_firestore.dart';

class Pasien {
  String? id;
  String? nomorRMPasien;
  String? namaPasien;
  String? tgllhrPasien;
  String? telpPasien;
  String? alamatPasien;

  Pasien({this.id, this.nomorRMPasien, this.namaPasien, this.tgllhrPasien, this.telpPasien, this.alamatPasien});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomorRMPasien': nomorRMPasien,
      'namaPasien': namaPasien,
      'tgllhrPasien': tgllhrPasien,
      'telpPasien': telpPasien,
      'alamatPasien': alamatPasien,
    };
  }

  Pasien.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        nomorRMPasien = doc.data()!['nomorRMPasien'],
        namaPasien = doc.data()!['namaPasien'],
        tgllhrPasien = doc.data()!['tgllhrPasien'],
        telpPasien = doc.data()!['telpPasien'],
        alamatPasien = doc.data()!['alamatPasien'];
}