import 'package:flutter/material.dart';
import 'package:bus_app/views/airport_line_view.dart';


class HomeView extends StatelessWidget {
  
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    
      appBar: AppBar(
      
        title: const Text('Lao Bus'),
        backgroundColor: Colors.blueAccent,
      
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
            
            ElevatedButton.icon(
              
              onPressed: () {
                
                Navigator.push(
                  
                  context,
                  MaterialPageRoute(builder: (context) => const BusListView()),
         
                  );
        
              },
        
              icon: const Icon(Icons.airplanemode_active),
              label: const Text('Airport Line'),
      
            ),
    
          ],
  
        ),
      
      ),

    );
  }
}