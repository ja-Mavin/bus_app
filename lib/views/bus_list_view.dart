import 'package:flutter/material.dart';
import 'package:bus_app/bus_stops_data/airport_line_data.dart';

class BusListView extends StatelessWidget {
  
  const BusListView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    
      appBar: AppBar(
      
        title: const Text('Lao Bus'),
        backgroundColor: Colors.blueAccent,
      
      ),
      
      body: ListView.builder(
      
        itemCount: BusListData.stops.length,
        
        itemBuilder: (context, index) {

          final stop = BusListData.stops[index]; // 1つ分のデータを取り出す
          
          return ListTile(
          
            leading: const Icon(Icons.airplanemode_active, color: Colors.blue,),
            title: Text(stop.name, style: const TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(stop.laoName),
            
            onTap: () {
              
              print("${stop.name} がタップされました");
              
            },
          
          );
          
        },
      
      ),

    );
  }
}