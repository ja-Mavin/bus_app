import 'package:flutter/material.dart';
import 'package:bus_app/bus_list_data.dart';

class BusListView extends StatelessWidget {
  
  const BusListView({super.key});

  @override
  Widget build(BuildContext context) {

    final displayStops = BusListData.stops
      
      .where((stop) => stop.busNumber == 'Airport Shuttle')
      .toList(); // 1つ分のデータを取り出す
    
    return Scaffold(
    
      appBar: AppBar(
      
        title: const Text('Lao Bus'),
        backgroundColor: Colors.blueAccent,
      
      ),
      
      body: ListView.builder(
      
        itemCount: displayStops.length,
        
        itemBuilder: (context, index) {

          final stops = displayStops[index]; // 1つ分のデータを取り出す
          
          return ListTile(
          
            leading: const Icon(Icons.airplanemode_active, color: Colors.blue,),
            title: Text(stops.name, style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(stops.laoName),
            
            onTap: () {
              
              print("${stops.name} がタップされました");
              
            },
          
          );
          
        },
      
      ),

    );
  }
}