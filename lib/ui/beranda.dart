import 'package:flutter/material.dart';
import '../widget/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }
        ),
      ),
      drawer: const Sidebar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("assets/img/logo_ubsi.png")
            ),
            const SizedBox(height: 10,),
            const Text("Klinik App", style: TextStyle(fontSize: 30),),
            Container(
              padding: const EdgeInsets.fromLTRB(7, 3, 7, 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent
              ),
              child: const Text("v.1.0.0", style: TextStyle(fontSize: 14, color: Colors.white),)
            ),
          ],
        ),
      ),
    );
  }
}
