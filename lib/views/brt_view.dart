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
        title: const Text('BRT'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('BRT', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
          ),
          
          Expanded(

            

            child: ListView.builder(
              itemCount: displayStops.length,
              itemBuilder: (context, index) {
                final stop = displayStops[index];
                return ListTile(
                // IDとラオ語名を出すだけの超シンプル構成
                leading: CircleAvatar(
                child: Text('${stop.stopId}'), 
                ),
                title: Text(stop.laoName),
                subtitle: Text(stop.enName),
                );
        },
            ),
          ),
        ],
      ),
    );
  }
}