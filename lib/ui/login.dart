// ignore_for_file: annotate_overrides, sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/material.dart';
import '../service/login_service.dart';

import 'beranda.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Text("Login Admin",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                const SizedBox(height: 50,),
                Center(
                  child: Form(
                    key: _formkey,
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          _usernameTextField(),
                          const SizedBox(height: 20,),
                          _passwordTextField(),
                          const SizedBox(height: 40,),
                          _tombolLogin(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField(){
    return TextFormField(
      decoration: const InputDecoration(labelText: "Username"),
      controller: _usernameCtrl,
    );
  }

  Widget _passwordTextField(){
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      obscureText: true,
      controller: _passwordCtrl,
    );
  }

  Widget _tombolLogin(){
    // ignore: sized_box_for_whitespace
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(child: const Text("Login"), onPressed: () async{
        String username = _usernameCtrl.text;
        String password = _passwordCtrl.text;
        await LoginService().login(username, password).then((value){
          if(value == true){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Beranda()));
          } else {
            AlertDialog alertDialog = AlertDialog(
              content: const Text("Username atau Password tidak valid"),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  // ignore: sort_child_properties_last
                  child: const Text("Ok"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                )
              ],
            );
            showDialog(context: context, builder: (context) => alertDialog);
          }
        });
      }),
    );
  }
}
