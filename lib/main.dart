import 'package:flutter/material.dart';
import 'package:dependency_injection_get_it/locator.dart';
import 'package:dependency_injection_get_it/view/home_page.dart';

void main() {
  // * Call the setup method to initialize the services
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dependency Injection',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const HomePage(),
    );
  }
}