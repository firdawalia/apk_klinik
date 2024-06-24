// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';
import 'pegawai_detail_page.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  final _idPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _nipPegawaiCtrl = TextEditingController();
  final _tglLahirPegawaiCtrl = TextEditingController();
  final _telpPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  // ignore: annotate_overrides
  void initState(){
    super.initState();
    setState(() {
      _namaPegawaiCtrl.text = widget.pegawai.namaPegawai!;
      _nipPegawaiCtrl.text = widget.pegawai.nipPegawai!;
      _tglLahirPegawaiCtrl.text = widget.pegawai.tglLahirPegawai!;
      _telpPegawaiCtrl.text = widget.pegawai.telpPegawai!;
      _emailPegawaiCtrl.text = widget.pegawai.emailPegawai!;
      _passwordPegawaiCtrl.text = widget.pegawai.passwordPegawai!;
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
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
                _wTombolUbah()
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

  Widget _wTombolUbah(){
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
          await PegawaiService().updatePegawai(pegawai).then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => PegawaiDetailPage(pegawai: pegawai))
            );
          });
        },
        child: const Text("Ubah")
    );
  }
}