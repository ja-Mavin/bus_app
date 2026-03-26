import 'package:flutter/material.dart';
import 'package:bus_app/views/home_view.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Stop {
  final int stopId;
  final String enName;
  final String laoName;
  final String jpName;
  final List<dynamic> lines;
  final Map<String, dynamic> orderInLine;

  Stop(this.stopId, this.enName, this.laoName, this.jpName, this.lines, this.orderInLine);

  factory Stop.fromJson(Map<String, dynamic> json) {
  return Stop(
    json['stopId'] as int? ?? 0,
    json['enName'] as String? ?? '',
    json['laoName'] as String? ?? '',
    json['jpName'] as String? ?? '',
    // もしリストじゃなくても空のリストにする
    json['lines'] is List ? json['lines'] as List : [],
    // もしマップじゃなくても空のマップにする
    json['orderInLine'] is Map<String, dynamic>
        ? json['orderInLine'] as Map<String, dynamic>
        : {},
  );
}
}

Future<List<Stop>> loadBusStops() async {
  final String response = await rootBundle.loadString('lib/assets/bus_stops.json');
  final List<dynamic> data = jsonDecode(response);
  return data.map((json) => Stop.fromJson(json)).toList();
}


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
        popupMenuTheme: const PopupMenuThemeData(
          labelTextStyle: WidgetStatePropertyAll(
            const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0))
          ),
        ),
      
        primarySwatch: Colors.blue,
      
      ),
      
      home: const HomeView(),

    
    );
  }
}

