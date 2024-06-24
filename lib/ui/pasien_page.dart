import 'package:flutter/material.dart';
import '../ui/pasien_form_page.dart';
import '../ui/pasien_item.dart';
import '../widget/sidebar.dart';

import '../model/pasien.dart';
import '../service/pasien_service.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  final PasienService _pasienService = PasienService();
  Future<List<Pasien>>? _pasienList;
  List<Pasien>? _retrievedPasienList;

  Future<void> _initRetrieval() async {
    _pasienList = _pasienService.retrievePasien();
    _retrievedPasienList = await _pasienService.retrievePasien();
  }

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future refreshData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _initRetrieval();
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // ignore: unused_local_variable
    double ffem = fem * 0.97;

    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pasien", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            }
        ),
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(8*fem),
              child: const Icon(Icons.add, color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => 	const PasienFormPage()));
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: FutureBuilder(
            future: _pasienList,
            builder: (BuildContext context, AsyncSnapshot<List<Pasien>> snapshot) {
              if(!snapshot.hasData){
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                  itemCount: _retrievedPasienList!.length,
                  itemBuilder: (context, index){
                    var pasien = _retrievedPasienList![index];
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        color: Colors.redAccent,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16),
                        child: const Icon(Icons.delete, color: Colors.white,),
                      ),
                      onDismissed: (direction){
                        _pasienService.deletePasien(pasien.id!);
                      },
                      direction: DismissDirection.endToStart,
                      child: PasienItem(pasien: pasien),
                    );
                  }
              );
            }
        ),
      ),
    );
  }
}