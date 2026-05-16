import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart'; // Google Fontsをインポート
// 自分で作ったファイルをインポートします
import 'views/home_view.dart';

void main() {
  runApp(const VientianeBusMap());
}

class VientianeBusMap extends StatelessWidget {
  const VientianeBusMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vientiane BusMap',
      debugShowCheckedModeBanner: false, // 右上の「DEBUG」ラベルを消す
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueAccent, // 好きな色をベースに設定
      ),
      home: const HomeView(), // ここで views/home_view.dart を呼び出す
    );
  }
}
