// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../service/poli_service.dart';
import '../ui/poli_form_page.dart';
import '../ui/poli_form_update_page.dart';
import '../model/poli.dart';

class PoliDetailPage extends StatefulWidget {
  final Poli poli;

  const PoliDetailPage({super.key, required this.poli});

  @override
  State<PoliDetailPage> createState() => _PoliDetailPageState();
}

class _PoliDetailPageState extends State<PoliDetailPage> {
  final PoliService _poliServiceNew = PoliService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Poli"),),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Nama Poli : ${widget.poli.nm_poli!}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolubah(),
              _tombolhapus()
            ],
          )
        ],
      )
    );
  }

  _tombolubah(){
    return ElevatedButton(
      onPressed: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PoliUpdateForm(poli: widget.poli))
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
      child: const Text("Ubah"),
    );
  }

  _tombolhapus(){
    return ElevatedButton(
      onPressed: (){
        AlertDialog alertDialog = AlertDialog(
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            // tombol ya
            ElevatedButton(
              onPressed: () async {
                await _poliServiceNew.deletePoli(widget.poli.id!);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PoliForm()));
              },
              // ignore: sort_child_properties_last
              child: const Text("YA"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            ),

            // tombol batal
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              // ignore: sort_child_properties_last
              child: const Text("Tidak"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.black),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
      child: const Text("Hapus"),
    );
  }
}