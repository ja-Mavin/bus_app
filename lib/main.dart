import 'package:flutter/material.dart';

void main() {
  
  runApp(const LaoBusApp());

}

class LaoBusApp extends StatelessWidget {
  
  const LaoBusApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      title: 'Lao Bus',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      
      ),
      
      home: const BusListPage(),
    
    );
  }
}

class BusListPage extends StatelessWidget {
  
  const BusListPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final busStops = [

      'Talat Sao (Central Bus Station)',
      'ITECC Mall',
      'Patuxay Park',
      'Wattay Airport',
      'Northern Bus Terminal',

    ];
    
    return Scaffold(
    
      appBar: AppBar(
      
        title: const Text('Lao Bus'),
        backgroundColor: Colors.blueAccent,
      
      ),
      
      body: ListView.builder(
      
        itemCount: busStops.length,
        itemBuilder: (context, index) {
        
          return ListTile(
          
            leading: const Icon(Icons.bus_alert, color: Colors.blue,),
            title: Text(busStops[index]),
            onTap: () {
            
              print("${busStops[index]} がタップされました");
            
            },
          
          );
        
        },
      
      ),
    
    );
  }
}