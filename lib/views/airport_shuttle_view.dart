import 'package:flutter/material.dart';
import 'package:bus_app/main.dart';

class AirportShuttleView extends StatefulWidget {
  const AirportShuttleView({super.key});
  @override
  State<AirportShuttleView> createState() => _AirportShuttleViewState();
}

class _AirportShuttleViewState extends State<AirportShuttleView> {
  List<Stop> stops = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await loadBusStops();
    setState(() {
      stops = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayStops =
        stops.where((stop) => stop.lineNumber == 'Airport Shuttle').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Airport Shuttle'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Airport Shuttle',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          const Text('Line Detail'),
          Expanded(
            child: ListView.builder(
              itemCount: displayStops.length,
              itemBuilder: (context, index) {
                final stop = displayStops[index];
                return ListTile(
                  leading: const Icon(Icons.airplanemode_active,
                      color: Colors.blue),
                  title: Text(stop.laoName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                  subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(stop.enName),
                      Text(stop.jpName),
                    ],
                  ),
                  trailing: IconButton(
                    icon:
                        const Icon(Icons.directions_bus, color: Colors.blue),
                    onPressed: () {
                      print("${stop.jpName}が選択されました");
                    },
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