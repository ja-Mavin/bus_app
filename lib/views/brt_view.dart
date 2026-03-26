import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:bus_app/main.dart';

class BRTView extends StatefulWidget {
  const BRTView({super.key});
  @override
  State<BRTView> createState() => _BRTViewState();
}

class _BRTViewState extends State<BRTView> {
  List<Stop> stops = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    print("--- 読み込み開始 ---");
    try {
      final data = await loadBusStops();
      //print("--- 読み込み完了！ 件数: ${data.length} ---");
      setState(() {
        stops = data;
      });
    } catch (e) {
    // もしここでエラーが出たら、JSONの書き方がプログラムと合っていません
    // print("🚨 エラー発生: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    final displayStops =
        stops.where((stop) => stop.lines.contains("BRT")).toList();

    displayStops.sort((a, b) {
      final aOrder = a.orderInLine["BRT"] as int? ?? 0;
      final bOrder = b.orderInLine["BRT"] as int? ?? 0;
      return aOrder.compareTo(bOrder);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('BRT', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Line Details', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayStops.length,
              itemBuilder: (context, index) {
                final stop = displayStops[index];
                
                return ListTile(
                  leading: CircleAvatar(radius: 22, foregroundColor: Colors.black, backgroundColor: const Color(0xFFFFB300), child: Text('${stop.stopId}'),),
                  title: Text(stop.laoName, style: const TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w800)),
                  subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(stop.enName, style: const TextStyle(color: Colors.black, fontSize: 14)),
                      Text(stop.jpName, style: const TextStyle(color: Colors.black, fontSize: 14)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}