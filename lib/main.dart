import 'package:comparador/components/input-generics.dart';
import 'package:comparador/controller/controller.dart';
import 'package:comparador/pages/page-comparate-produte.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  Get.put(Controlador());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageComparateProdute(),
    );
  }
}
