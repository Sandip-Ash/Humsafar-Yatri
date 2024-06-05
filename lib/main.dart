import 'package:flutter/material.dart';
import 'package:tourism_app/constants/dataset.dart';
import 'package:tourism_app/tourism_portal_1/pages/welcome_screen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Humsafar Yatri',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)
      ),
      debugShowCheckedModeBanner: false,
      home: const Welcome_page(),
    );
  }
}
