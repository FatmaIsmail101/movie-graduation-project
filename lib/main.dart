import 'package:flutter/material.dart';
import 'browse_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Browser',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // خليها داكنة عشان نفس شكل الصورة
      home: BrowseTab(),
    );
  }
}
