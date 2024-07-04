import 'package:flutter/material.dart';
import 'package:qiita_app/src/pages/top_page.dart'; //ファイルをインポート

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TopPage(), // TopPage を表示
    );
  }
}
