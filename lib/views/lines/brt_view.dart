import 'package:flutter/material.dart';
//import 'package:bus_app/widgets/home_button_template.dart';

class BrtView extends StatelessWidget {
  const BrtView({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> busStops = [
      "Talat Sao (Central Station)",
      "Khua Din Market",
      "Vangvieng Bus Terminal", // テスト用
      "Patuxay Park",
      "Phonxay",
      "Nongbone",
      "Pakuang",
      "Dongdok (National University)",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('BRT Lines'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFD100), // BRTイエロー
        // AppBarとbodyの間の線
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey[300], height: 1.0),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // 縦方向の真ん中寄せ
            // mainAxisSize: MainAxisSize.min, // 💡 Column自体を中身のサイズにギュッと縮める
            children: [
              const SizedBox(height: 8), // 上にスペース

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ), // 画面の左右に少し隙間を作る
                child: Card(
                  elevation: 3, // 💡 箱の影の強さ（立体感）
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // 角を丸くする
                    side: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ), // うすい枠線
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16), // 箱の内側の余白
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.center, // 中の文字を左寄せにする
                      children: [
                        // 箱のタイトル
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.info_outline,
                              color: Colors.orange,
                            ), // 💡 インフォアイコン
                            const SizedBox(width: 8),
                            const Text(
                              "Service Information",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const Divider(height: 24), // 💡 タイトルの下の区切り線
                        // 運行情報の本文（最初は固定の文章）
                        const Text(
                          "All BRT lines are operating normally.\n\n" // 運行状況
                          "⏱️ Peak Hours: Every 10-15 mins\n" // 💡 ラッシュ時（朝・夕）の感覚
                          "⏱️ Off-Peak: Every 20-30 mins", // 💡 昼間などの運行間隔
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            height: 1.5, // 少し行間を広げて見やすく
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16), // 情報箱の下にスペース

              const Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "BRT Bus Stops",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8), // タイトルとリストの間のスペース

              Expanded(
                child: ListView.builder(
                  itemCount: busStops.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6), // 各カードの上下にスペース
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xFFFFD100),
                          child: Icon(Icons.directions_bus, color: Colors.black, size: 20),
                        ),
                        title: Text(
                          busStops[index],
                          style: const TextStyle(
                            fontSize: 15, 
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios, 
                          size: 14, color: Colors.grey
                        ),
                        onTap: () {
                          print("Tapped on ${busStops[index]}"); // タップしたときの動作（今はコンソールに表示するだけ）
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
