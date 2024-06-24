// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';

class Poli {
  final String? id;
  // ignore: non_constant_identifier_names
  final String? nm_poli;

  Poli({this.id, this.nm_poli});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nm_poli': nm_poli,
    };
  }

  Poli.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        nm_poli = doc.data()!['nm_poli'];
}