import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../service/pasien_service.dart';
import 'pasien_detail_page.dart';

class PasienUpdateFormPage extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateFormPage({Key? key, required this.pasien}) : super(key: key);

  @override
  State<PasienUpdateFormPage> createState() => PasieniUpdateFormPageState();
}

class PasieniUpdateFormPageState extends State<PasienUpdateFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _idPasienCtrl = TextEditingController();
  final _nomorRMPasienCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tgllhrPasienCtrl = TextEditingController();
  final _telpPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  // ignore: annotate_overrides
  void initState(){
    super.initState();
    setState(() {
      _idPasienCtrl.text = widget.pasien.id!;
      _nomorRMPasienCtrl.text = widget.pasien.nomorRMPasien!;
      _namaPasienCtrl.text = widget.pasien.namaPasien!;
      _tgllhrPasienCtrl.text = widget.pasien.tgllhrPasien!;
      _telpPasienCtrl.text = widget.pasien.telpPasien!;
      _alamatPasienCtrl.text = widget.pasien.alamatPasien!;
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // ignore: unused_local_variable
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pasien")),
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
    // ignore: unused_local_variable
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
          Pasien pasien = Pasien(
            id: _idPasienCtrl.text,
            nomorRMPasien: _nomorRMPasienCtrl.text,
            namaPasien: _namaPasienCtrl.text,
            tgllhrPasien: _tgllhrPasienCtrl.text,
            telpPasien: _telpPasienCtrl.text,
            alamatPasien: _alamatPasienCtrl.text,
          );
          await PasienService().updatePasien(pasien).then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => PasienDetailPage(pasien: pasien))
            );
          });
        },
        child: const Text("Ubah")
    );
  }
}