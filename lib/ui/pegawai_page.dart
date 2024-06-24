// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
// ignore: unused_import
import '../ui/pegawai_detail_page.dart';
import '../ui/pegawai_item.dart';
import '../ui/pegawai_form.dart';
import '../widget/sidebar.dart';

import '../model/pegawai.dart';
import '../service/pegawai_service.dart';

class PegawaiPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  final PegawaiService _pegawaiService = PegawaiService();
  Future<List<Pegawai>>? _pegawaiList;
  List<Pegawai>? _retrievedPegawaiList;

  Future<void> _initRetrieval() async {
    _pegawaiList = _pegawaiService.retrievePegawai();
    _retrievedPegawaiList = await _pegawaiService.retrievePegawai();
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
    double ffem = fem * 0.97;

    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pegawai", style: TextStyle(color: Colors.white),),
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
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add, color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => 	const PegawaiForm()));
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: FutureBuilder(
            future: _pegawaiList,
            builder: (BuildContext context, AsyncSnapshot<List<Pegawai>> snapshot) {
              if(!snapshot.hasData){
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                  itemCount: _retrievedPegawaiList!.length,
                  itemBuilder: (context, index){
                    var pegawai = _retrievedPegawaiList![index];
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        color: Colors.redAccent,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16),
                        child: const Icon(Icons.delete, color: Colors.white,),
                      ),
                      onDismissed: (direction){
                        _pegawaiService.deletePegawai(pegawai.id!);
                      },
                      direction: DismissDirection.endToStart,
                      child: PegawaiItemPage(pegawai: pegawai),
                    );
                  }
              );
            }
        ),
      ),
    );
  }
}