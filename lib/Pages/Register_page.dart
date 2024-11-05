import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resister Page'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        leading: Icon(Icons.arrow_back),
      ),
      body: Container(
        height: 320,
        width: 300,
        color: Colors.white
      ),
    );
  }
}
