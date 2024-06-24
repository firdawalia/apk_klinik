import 'package:flutter/material.dart';
import '../../model/pasien.dart';
import 'pasien_detail_page.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;

  const PasienItem({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    
    return GestureDetector(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => PasienDetailPage(pasien: pasien)));
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 7*fem),
        padding: EdgeInsets.fromLTRB(15*fem, 10*fem, 15*fem, 10*fem),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            SizedBox(
              width: 40*fem,
              height: 40*fem,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: SizedBox(height: 25*fem, width: 25*fem, child: Image.asset("assets/img/pasien.png")),
              ),
            ),
            SizedBox(width: 10*fem,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pasien.namaPasien!, style: TextStyle(fontSize: 17*ffem, fontWeight: FontWeight.bold),),
                Row(
                  children: [
                    Icon(Icons.pin_drop, size: 15*ffem,),
                    SizedBox(
                      width: 230*fem,
                      child: Text(pasien.alamatPasien!, style: TextStyle(fontSize: 10*ffem),)
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(width: 10,),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}