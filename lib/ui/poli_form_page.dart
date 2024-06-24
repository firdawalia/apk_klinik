// ignore_for_file: unused_import, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../ui/poli_detail_page.dart';
import '../model/poli.dart';
import '../service/poli_service.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _idPoliCtrl = TextEditingController();
  final _namaPoliCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Poli")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Form(
            child: Column(
              children: [
                _wTextField(namaField: "Nama Poli", namaController: _namaPoliCtrl, namaIcon: Icons.room_preferences_rounded),
                const SizedBox(height: 10),
                _wTombolSimpan()
              ],
            )
          ),
        ),
      ),
    );
  }

  Widget _wTextField({required String namaField, required namaController, required namaIcon}){
    return TextField(
      decoration: InputDecoration(
        labelText: namaField,
        prefixIcon: Icon(namaIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),
      controller: namaController,
    );
  }

  Widget _wTombolSimpan(){
    return ElevatedButton(
      onPressed: () async {
        Poli poli = Poli(
            // id: _idPoliCtrl.text,
            nm_poli: _namaPoliCtrl.text,
        );
        await PoliService().addPoli(poli).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => PoliDetailPage(poli: poli)));
        });
      },
      child: const Text("Simpan")
    );
  }
}