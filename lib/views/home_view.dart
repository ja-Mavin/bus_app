import 'package:flutter/material.dart';
import 'package:bus_app/views/all_stops_view.dart'; // BRTの画面を呼び出すためにインポート

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
        child: Column(
          children: [
            // 1. メインエリア（広がる部分）
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello, Vientiane!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllStopsView(),
                          ),
                        );
                      },
                      child: const Text('ທຸກສະຖານີ / All Stations'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
