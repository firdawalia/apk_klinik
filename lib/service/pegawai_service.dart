import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/pegawai.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

class PegawaiService{
  addPegawai(Pegawai pegawai) async {
    await _db.collection("pegawai").add(pegawai.toMap());
  }

  updatePegawai(Pegawai pegawai) async {
    await _db.collection("pegawai").doc(pegawai.id).update(pegawai.toMap());
  }

  Future<void> deletePegawai(String id) async {
    await _db.collection("pegawai").doc(id).delete();
  }

  Future<List<Pegawai>> retrievePegawai() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("pegawai").get();
    return snapshot.docs
        .map((docSnapshot) => Pegawai.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}