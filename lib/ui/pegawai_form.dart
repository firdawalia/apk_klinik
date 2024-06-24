// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';
import 'pegawai_detail_page.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPegawaiCtrl = TextEditingController();
  final _nipPegawaiCtrl = TextEditingController();
  final _tglLahirPegawaiCtrl = TextEditingController();
  final _telpPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // ignore: unused_local_variable
    double ffem = fem * 0.97;

    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15*fem, 15*fem, 15*fem, 0*fem),
          child: Form(
            key: _formKey,
              child: Column(
              children: [
                _wTextField(namaField: "NIP Pegawai", namaController: _nipPegawaiCtrl, namaIcon: Icons.credit_card, tipekeyboard: TextInputType.number),
                _wTextField(namaField: "Nama Pegawai", namaController: _namaPegawaiCtrl, namaIcon: Icons.people_alt),
                _wTextField(namaField: "Tanggal Lahir Pegawai", namaController: _tglLahirPegawaiCtrl, namaIcon: Icons.date_range_outlined),
                _wTextField(namaField: "Telp Pegawai", namaController: _telpPegawaiCtrl, namaIcon: Icons.phone, tipekeyboard: TextInputType.number),
                _wTextField(namaField: "Email Pegawai", namaController: _emailPegawaiCtrl, namaIcon: Icons.email),
                _wTextField(namaField: "Password Pegawai", namaController: _passwordPegawaiCtrl, namaIcon: Icons.lock),
                _wTombolSimpan(),
                SizedBox(height: 20*fem,)
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
    // ignore: unused_local_variable
    double ffem = fem * 0.97;

    return Container(
      padding: EdgeInsets.only(bottom: 15*fem),
      child: TextFormField(
        keyboardType: (tipekeyboard==null) ? TextInputType.text : tipekeyboard,
        decoration: InputDecoration(
          labelText: namaField,
          prefixIcon: Icon(namaIcon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10*fem)
          ),
        ),
        controller: namaController,
        validator: (value) {
          //jika inputan tidak sama dengan password
          if (value!.isEmpty) {
            return namaField + " tidak boleh kosong!";
          }
          return null;
        },
      ),
    );
  }

  Widget _wTombolSimpan(){
    return ElevatedButton(
        onPressed: () async {
          Pegawai pegawai = Pegawai(
            nipPegawai: _nipPegawaiCtrl.text,
            namaPegawai: _namaPegawaiCtrl.text,
            tglLahirPegawai: _tglLahirPegawaiCtrl.text,
            telpPegawai: _telpPegawaiCtrl.text,
            emailPegawai: _emailPegawaiCtrl.text,
            passwordPegawai: _passwordPegawaiCtrl.text,
          );
          await PegawaiService().addPegawai(pegawai).then((value) async {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => PegawaiDetailPage(pegawai: pegawai))
            );
          });
        },
        // ignore: prefer_const_constructors
        child: Text("Simpan")
    );
  }

}