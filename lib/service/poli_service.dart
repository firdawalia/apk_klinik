import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/poli.dart';

final FirebaseFirestore _db = FirebaseFirestore.instance;

class PoliService{
  addPoli(Poli poli) async {
    await _db.collection("poli").add(poli.toMap());
  }

  updatePoli(Poli poli) async {
    await _db.collection("poli").doc(poli.id).update(poli.toMap());
  }

  Future<void> deletePoli(String id) async {
    await _db.collection("poli").doc(id).delete();
  }

  Future<List<Poli>> retrievePoli() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("poli").get();
    return snapshot.docs
        .map((docSnapshot) => Poli.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}