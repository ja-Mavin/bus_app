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

