import 'package:flutter/material.dart';
import '../ui/poli_detail_page.dart';
import '../model/poli.dart';

 class PoliItem extends StatelessWidget {
   final Poli poli;

   const PoliItem({super.key, required this.poli});

   @override
   Widget build(BuildContext context) {
   return GestureDetector(
       child: Card(
           child: ListTile(
               title: Text("${poli.nm_poli}"),
           ),
       ),
       onTap: () {
         Navigator.push(context,
             MaterialPageRoute(builder: (context) => PoliDetailPage(poli: poli)));
         },
      );
   }
 }