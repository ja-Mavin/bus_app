import 'package:flutter/material.dart';
import 'package:bus_app/bus_list_data.dart';

class AirportShuttleView extends StatelessWidget {
  
  const AirportShuttleView({super.key});

  @override
  Widget build(BuildContext context) {

    final displayStops = BusListData.stops
      
      .where((stop) => stop.lineNumber == 'Airport Shuttle')
      .toList(); // 1つ分のデータを取り出す
    
    return Scaffold(
    
      appBar: AppBar(
      
        title: const Text('Airport Shuttle', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        
        leading: IconButton(
          onPressed: () => Navigator.pop(context), // 前の画面に戻る
          icon: const Icon(Icons.close)
        ),
        
        backgroundColor: const Color.fromARGB(255, 152, 180, 207),
      
      ),
      
      body: Column(
        children: [
          
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("Airport Shuttle", style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold), ),
          ),

          Text("Line Detail"),

          Expanded(
            child: ListView.builder(
              itemCount: displayStops.length,
              itemBuilder: (context, index) 
            {

              final stops = displayStops[index]; // 1つ分のデータを取り出す
          
              return ListTile(
          
                leading: const Icon(Icons.airplanemode_active, color: Colors.blue,),
                title: Text(stops.laoName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(stops.enName),
                    Text(stops.jpName),
                  ],
                ),
          
                trailing: IconButton(
                  icon: const Icon(Icons.directions_bus, color: Colors.blue,),
                  onPressed: () {

                    switch (stops.stopsId) {
                      case 1:
                        // 1番の停留所が押されたときの処理
                        print("Wattay International Airport が押されました");
                        break;
                      case 2:
                        // 2番の停留所が押されたときの処理
                        print("Sikhay Junction が押されました");
                        break;
                      case 3:
                        // 3番の停留所が押されたときの処理
                        print("Fa Ngum Statue が押されました");
                        break;
                      case 4:
                        // 4番の停留所が押されたときの処理
                        print("Mixay Temple が押されました");
                        break;
                      case 5:
                        // 5番の停留所が押されたときの処理
                        print("Nam Phou Fountain が押されました");
                        break;
                      case 6:
                        // 6番の停留所が押されたときの処理
                        print("Talat Sao (CBS) が押されました");
                        break;
                      default:
                        // 不明な停留所が押されたときの処理
                        print("不明な停留所が押されました");
                    }
              
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