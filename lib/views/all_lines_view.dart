import 'package:flutter/material.dart';
import 'package:bus_app/views/brt_view.dart';

class RouteListView extends StatelessWidget {
  const RouteListView({super.key});

  

  //↓ボタン量産用の設計図

  //  creatingStationButton(
  //    "<<ラオ語>>", 
  //    "<<英語>>",  
  //    Colors.<<~~>>,
  //    IconData <<~~>>,
  //    const <<遷移先のページクラス>>(), context,
  //  ),


  Widget createStationButton(
    String lao, 
    String eng, 
    Color col1, 
    Color col2,
    IconData icon,
    Widget targetPage, 
    BuildContext context
  ) 

  { 

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 80, // アイコンと2行テキストを入れるので少し高めに

        child: ElevatedButton( // ★ .icon を取って普通のElevatedButtonに
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => targetPage),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: col1,
            foregroundColor: col2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          // ★ ここからがアイコン固定の仕掛け
          child: Row(
            children: [
              // 1. アイコン固定エリア（幅を45に固定）
              SizedBox(
                width: 45, 
                child: Icon(icon, size: 30), // 引数のアイコンを表示
              ),
              
              const SizedBox(width: 15), // アイコンと文字の間の隙間

              // 2. テキストエリア（残りの幅を全部使う）
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start, // ★ 文字を左寄せに
                  children: [
                    Text(lao, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(eng, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              
              // 3. 右端の矢印（これがあると一気にアプリっぽくなります）
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ລາຍຊື່ເສັ້ນທາງ / Route List', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const SizedBox(height: 20),

            const Text(
              'ລາຍຊື່ເສັ້ນທາງ',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20),
            
            createStationButton(
              "ບີອາທີ (ລະບົບລົດເມດ່ວນ)", 
              "BRT (Bus Rapid Transit)", 
              Colors.amber, 
              Colors.black,
              Icons.directions_bus,
              const BRTView(), context
            ),

            createStationButton(
              "ລົດເມຂົນສົ່ງສະໜາມບິນ", 
              "Airport Shuttle", 
              Colors.blue, 
              Colors.white,
              Icons.directions_bus, 
              const BRTView(), context
            )

          ],
        ),
      ),
    );
  }
}