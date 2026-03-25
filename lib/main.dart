import 'package:flutter/material.dart';
import 'package:bus_app/views/home_view.dart';

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
      
      home: const HomeView(),

    
    );
  }
}

