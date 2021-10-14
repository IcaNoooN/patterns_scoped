import 'package:flutter/material.dart';
import 'package:patterns_scoped/pages/create_page.dart';
import 'package:patterns_scoped/pages/home_page.dart';
import 'package:patterns_scoped/pages/update_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        CreatePage.id: (context) => const CreatePage(),
        UpdatePage.id: (context) => UpdatePage(),
      },
    );
  }
}