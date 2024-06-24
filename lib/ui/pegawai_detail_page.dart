import 'package:flutter/material.dart';
// ignore: unused_import
import '../service/pegawai_service.dart';
import '../ui/pegawai_update_form.dart';
import '../model/pegawai.dart';
import 'pegawai_page.dart';

class PegawaiDetailPage extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiDetailPage({super.key, required this.pegawai});

  @override
  State<PegawaiDetailPage> createState() => _PegawaiDetailPageState();
}

class _PegawaiDetailPageState extends State<PegawaiDetailPage> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth; //selain text
    double ffem = fem * 0.97; //untuk text

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pegawai"),),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15*fem, 0*fem, 15*fem, 0*fem),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20*fem),
              Center(
                child: SizedBox(
                  height: 110*fem,
                  width: 110*fem,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: SizedBox(
                        height: 65*fem,
                        width: 65*fem,
                        child: Image.asset("assets/img/pegawai.png",)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5*fem,),
              Align(alignment: Alignment.center, child: Text(widget.pegawai.namaPegawai!, style: TextStyle(fontSize: 26*ffem, fontWeight: FontWeight.bold))),
              // ignore: prefer_interpolation_to_compose_strings
              Align(alignment: Alignment.center, child: Text("NIP : " + widget.pegawai.nipPegawai!, style: TextStyle(fontSize: 16*ffem))),
              SizedBox(height: 30*fem,),

              Text("Detail Pegawai :", style: TextStyle(fontSize: 18*ffem, fontWeight: FontWeight.bold)),
              SizedBox(height: 5*fem,),
              _wText(namaKetField: "NIP Pegawai", namaField: widget.pegawai.nipPegawai, namaIcon: Icons.credit_card, warnaBG: Colors.blueAccent),
              _wText(namaKetField: "Nama Pegawai", namaField: widget.pegawai.namaPegawai, namaIcon: Icons.people_alt, warnaBG: Colors.yellow),
              _wText(namaKetField: "Password Pegawai", namaField: widget.pegawai.passwordPegawai, namaIcon: Icons.lock, warnaBG: Colors.green),
              _wText(namaKetField: "Tanggal Lahir Pegawai", namaField: widget.pegawai.tglLahirPegawai, namaIcon: Icons.date_range_outlined, warnaBG: Colors.redAccent),
              _wText(namaKetField: "Telp Pegawai", namaField: widget.pegawai.telpPegawai, namaIcon: Icons.phone, warnaBG: Colors.orange),
              _wText(namaKetField: "Email Pegawai", namaField: widget.pegawai.emailPegawai, namaIcon: Icons.home, warnaBG: Colors.deepPurple),
              SizedBox(height: 20*fem),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _wTombolUbah(),
                  SizedBox(width: 15*fem,),
                  _wTombolHapus()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _wText({required String namaKetField, required namaField, required namaIcon, required Color warnaBG}){
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      margin: EdgeInsets.only(bottom: 10*fem),
      padding: EdgeInsets.zero,
      color: Colors.white,
      child: ListTile(
        title: Text(namaKetField, style: TextStyle(fontSize: 11*ffem, fontWeight: FontWeight.bold)),
        subtitle: Text(namaField, style: TextStyle(fontSize: 16*ffem)),
        leading: CircleAvatar(
          backgroundColor: warnaBG,
          child: SizedBox(height: 50*fem, width: 50*fem, child: Icon(namaIcon, color: Colors.white)),
        ),
        dense: true,
        // visualDensity: VisualDensity(vertical: -3),
        // contentPadding: EdgeInsets.only(bottom: 10),
      ),
    );
  }

  Widget _wTombolUbah(){
    return Expanded(
      child: ElevatedButton(
        onPressed: (){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PegawaiUpdateForm(pegawai: widget.pegawai))
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
        child: const Text("Ubah"),
      ),
    );
  }

  Widget _wTombolHapus(){
    return Expanded(
      child: ElevatedButton(
        onPressed: (){
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin ingin menghapus data ini?"),
            actions: [
              // tombol ya
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PegawaiPage()));
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
                child: const Text("TIDAK"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.white),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
        child: const Text("Hapus"),
      ),
    );
  }
}