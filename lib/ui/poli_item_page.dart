import 'package:flutter/material.dart';
import '../../model/poli.dart';
import 'poli_detail_page.dart';

class PoliItemPage extends StatelessWidget {
  final Poli poli;

  const PoliItemPage({super.key, required this.poli});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => PoliDetailPage(poli: poli)));
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(poli.nm_poli!, style: const TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}