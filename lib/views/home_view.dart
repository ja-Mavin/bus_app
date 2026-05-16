//import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bus_app/widgets/home_button_template.dart';
import 'package:bus_app/views/lines/brt_view.dart';
// import 'package:bus_app/views/all_stops_view.dart'; // BRTの画面を呼び出すためにインポート

void main() {
  runApp(const HomeView());
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上のDEBUG帯を消す
      debugShowCheckedModeBanner: false,
      title: 'Vientiane BusMap',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vientiane BusMap'),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
        // AppBarとbodyの間の線
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey[300], height: 1.0),
        ),
      ),
      // ノッチを避けるためのSafeArea
      body: SafeArea(
        // 💡 Center と Column のシンプルな組み合わせにします
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Column自体を中身のサイズにギュッと縮める
            children: [
              const Text(
                "Hello, Vientiane!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              const Text(
                "Welcome to the Vientiane BusMap App.",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 16),

              // BRTにつながるボタン
              toBuslines_Button(
                text: "BRT Bus Lines",
                backgroundColor: const Color(0xFFFFD100), // BRTイエロー
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BrtView()),
                  );
                },
              ),

              const SizedBox(height: 8),

              // ...につながるボタン
              toBuslines_Button(
                text: "Other City Bus Lines",
                onPressed: () {
                  // ここに遷移のコードを書く
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
