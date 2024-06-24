// ignore_for_file: unused_local_variable, duplicate_ignore

import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../service/pasien_service.dart';
import 'pasien_detail_page.dart';

class PasienFormPage extends StatefulWidget {
  const PasienFormPage({super.key});

  @override
  State<PasienFormPage> createState() => _PasienFormPageState();
}

class _PasienFormPageState extends State<PasienFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRMPasienCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tgllhrPasienCtrl = TextEditingController();
  final _telpPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // ignore: unused_local_variable
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pasien")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15*fem, 15*fem, 15*fem, 0*fem),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _wTextField(namaField: "Nomor RM Pasien", namaController: _nomorRMPasienCtrl, namaIcon: Icons.room_preferences_rounded, tipekeyboard: TextInputType.number),
                _wTextField(namaField: "Nama Pasien", namaController: _namaPasienCtrl, namaIcon: Icons.people_alt),
                _wTextField(namaField: "Tanggal Lahir Pasien", namaController: _tgllhrPasienCtrl, namaIcon: Icons.date_range_outlined),
                _wTextField(namaField: "Telp Pasien", namaController: _telpPasienCtrl, namaIcon: Icons.phone, tipekeyboard: TextInputType.number),
                _wTextField(namaField: "Alamat Pasien", namaController: _alamatPasienCtrl, namaIcon: Icons.home),
                _wTombolSimpan()
              ],
            )
          ),
        ),
      ),
    );
  }

  Widget _wTextField({required String namaField, required namaController, required namaIcon, tipekeyboard}){
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    
    return Container(
      padding: EdgeInsets.only(bottom: 15*fem),
      child: TextField(
        keyboardType: (tipekeyboard==null) ? TextInputType.text : tipekeyboard,
        decoration: InputDecoration(
          labelText: namaField,
          prefixIcon: Icon(namaIcon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10*fem)
          ),
        ),
        controller: namaController,
      ),
    );
  }

  Widget _wTombolSimpan(){
    return ElevatedButton(
      onPressed: () async {
        Pasien pasien = Pasien(
            nomorRMPasien: _nomorRMPasienCtrl.text,
            namaPasien: _namaPasienCtrl.text,
            tgllhrPasien: _tgllhrPasienCtrl.text,
            telpPasien: _telpPasienCtrl.text,
            alamatPasien: _alamatPasienCtrl.text,
        );
        await PasienService().addPasien(pasien).then((value) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) => PasienDetailPage(pasien: pasien))
          );
        });
      },
      child: const Text("Simpan")
    );
  }
}