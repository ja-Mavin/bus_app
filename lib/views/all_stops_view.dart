import 'package:flutter/material.dart';
import 'package:bus_app/model/stops_load_model.dart'; // パスを確認してください
import '../service/bus_service.dart'; // パスを確認してください

class AllStopsView extends StatelessWidget {
  const AllStopsView({super.key});

  // スプレッドシートからデータを取得する関数

  // fetchBusStopsの中身がこれだけになります！
  Future<List<BusStop>> fetchBusStops() {
    return BusService.fetchRoute(
      'https://docs.google.com/spreadsheets/d/e/2PACX-1vTRpwQpniGbCj3Qn4xkWEoimMnJep190R-YhBaN_K3KuiJxP9fi2CF3VlJ0SII9Z8h_vUz4DXKJ8DUQ/pub?gid=1688885384&single=true&output=csv',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Stations / ທຸກສະຖານີ'),
        centerTitle: true,
      ),

      
      body: FutureBuilder<List<BusStop>>(
        future: fetchBusStops(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // 読み込み中
          } else if (snapshot.hasError) {
            return Center(child: Text('エラー: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('駅データが見つかりません'));
          }

          final stops = snapshot.data!;
          return ListView.builder(
            itemCount: stops.length,
            itemBuilder: (context, index) {
              final stop = stops[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(child: Text(stop.id)),
                  title: Text(
                    "${stop.nameLao} / ${stop.nameEn}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${stop.nameJp}\n${stop.nameZh}'),
                  trailing: const Icon(
                    Icons.location_on,
                    color: Colors.redAccent,
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
