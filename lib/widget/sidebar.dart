import 'package:flutter/material.dart';
import '../ui/pegawai_page.dart';
import '../ui/pasien_page.dart';
import '../ui/poli_page.dart';
import '../ui/beranda.dart';
import '../ui/login.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: Image.asset("assets/img/logo_ubsi.png"),
            accountName: const Text("Admin"),
            accountEmail: const Text("admin@admin.com"),
            decoration: const BoxDecoration(
              color: Colors.blue
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Beranda"),
            onTap: (){
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Beranda()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.accessible),
            title: const Text("Poli"),
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const PoliPage()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Pegawai"),
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PegawaiPage()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.account_box_sharp),
            title: const Text("Pasien"),
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const PasienPage()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text("Keluar"),
            onTap: (){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}