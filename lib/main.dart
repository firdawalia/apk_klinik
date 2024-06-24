import 'package:apk_klinik/firebase_options.dart';
// ignore: unused_import
import 'package:apk_klinik/ui/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../ui/beranda.dart';
import '../helpers/user_info.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: unused_local_variable
  var token = await UserInfo().getToken();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    title: "Apk Klinik",
    debugShowCheckedModeBanner: false,
    //home: token == null ? Login() : Beranda(),
    home: Beranda(),
  ));
}