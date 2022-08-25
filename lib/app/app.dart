import 'package:flutter/material.dart';
import 'package:smart_home/app/root/root_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
      theme: ThemeData.dark(),
      home: const RootPage(),
    );
  }
}