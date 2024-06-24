import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/pasien.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

class PasienService{
  addPasien(Pasien pasien) async {
    await _db.collection("pasien").add(pasien.toMap());
  }

  updatePasien(Pasien pasien) async {
    await _db.collection("pasien").doc(pasien.id).update(pasien.toMap());
  }

  Future<void> deletePasien(String id) async {
    await _db.collection("pasien").doc(id).delete();
  }

  Future<List<Pasien>> retrievePasien() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("pasien").get();
    return snapshot.docs
        .map((docSnapshot) => Pasien.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}