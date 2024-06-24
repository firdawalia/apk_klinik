import 'package:flutter/material.dart';

import '../constant.dart';

class PegawaiEditForm extends StatefulWidget {
  const PegawaiEditForm({Key? key}) : super(key: key);
  // ignore: library_private_types_in_public_api, annotate_overrides
  _PegawaiEditFormState createState() => _PegawaiEditFormState();
}
class _PegawaiEditFormState extends State<PegawaiEditForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Pegawai"),
        backgroundColor: Pallette.primary,
        foregroundColor: Pallette.white,),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const TextField(
                  decoration: InputDecoration(labelText: "Id Pegawai")),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: const Text("Simpan"))
            ],
          ),
        ),
      ),
    );
  }
}