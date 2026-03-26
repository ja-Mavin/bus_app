import 'package:flutter/material.dart';
import 'package:bus_app/views/airport_shuttle_view.dart';


class HomeView extends StatelessWidget {
  
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    
      appBar: AppBar(
      
        title: const Text('Vientiane BusMap', style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold), ),
        backgroundColor: Colors.blueAccent,

        actions: [
          PopupMenuButton(
            offset: const Offset(0, 50),
            constraints: const BoxConstraints(
              minWidth: 100,
            ),
            icon: const Icon(Icons.menu),
            onSelected: (String result) {
              // メニューが選択されたときの処理
              // print("${result}が選択されました");

             },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(value: 'Language',child: Text('Language')),
              const PopupMenuItem<String>(value: 'Settings', child: Text('Settings')),
              const PopupMenuItem<String>(value: 'Help', child: Text('Help')),
              const PopupMenuItem<String>(value: 'About', child: Text('About')),
            ],
          )
        ],
      ),
      
      body: Center( // 画面の真ん中に置くための外枠
        
        child: Column(
    
          mainAxisAlignment: MainAxisAlignment.center, // 縦方向の真ん中に寄せる
          
          children: [
            
            const Text(
              
              'Home',
              style: TextStyle(fontSize: 24), // 少し大きくすると見やすくなります
            
            ),
            
            const SizedBox(height: 20), // ★文字とボタンの間の「スキマ」を作る
            
            ElevatedButton.icon( // Airport Shuttleへの遷移ボタン
              
              onPressed: () {
                
                Navigator.push(  
                  context,
                  MaterialPageRoute(builder: (context) => const AirportShuttleView()),
                );
              },
              icon: const Icon(Icons.airplanemode_active),
              label: const Text('Airport Shuttle'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250,50),
              textStyle: 
                const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 20), // ★文字とボタンの間の「スキマ」を作る

            ElevatedButton.icon( // Number 14 Lineへの遷移ボタン
              
              onPressed: () {
                Navigator.push(  
                   context,
                   MaterialPageRoute(builder: (context) => const AirportShuttleView()),
                );
              },
              icon: const Icon(Icons.directions_bus),
              label: const Text('Number 14 Line'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250,50),
              textStyle: 
                const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
    
          ],
  
        ),
      
      ),

    );
  }
}