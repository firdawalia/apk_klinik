import 'package:flutter/material.dart';
import '../service/poli_service.dart';
import '../model/poli.dart';
import 'poli_detail_page.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;
  const PoliUpdateForm({Key? key, required this.poli}) : super(key: key);

  @override
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _idPoliCtrl = TextEditingController();
  final _namaPoliCtrl = TextEditingController();

  // ignore: annotate_overrides
  void initState(){
    super.initState();
    setState(() {
      _idPoliCtrl.text = widget.poli.id!;
      _namaPoliCtrl.text = widget.poli.nm_poli!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Poli")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Form(
            key: _formKey,
              child: Column(
                children: [
                  _wTextField(namaField: "Nama Poli", namaController: _namaPoliCtrl, namaIcon: Icons.room_preferences_rounded),
                  const SizedBox(height: 10),
                  _wTombolUbah()
                ],
              )),
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

  Widget _wTombolUbah(){
    return ElevatedButton(
        onPressed: () async {
          Poli poli = Poli(
            id: _idPoliCtrl.text,
            nm_poli: _namaPoliCtrl.text,
          );
          await PoliService().updatePoli(poli).then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => PoliDetailPage(poli: poli)));
          });
        },
        child: const Text("Ubah")
    );
  }
}