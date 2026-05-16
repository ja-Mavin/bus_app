import 'package:flutter/material.dart';
import 'package:bus_app/widgets/home_button_template.dart';

class BrtView extends StatelessWidget {
  const BrtView({super.key});

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.center, // 縦方向の真ん中寄せ
            mainAxisSize: MainAxisSize.min, // 💡 Column自体を中身のサイズにギュッと縮める
            children: [
              const Text(
                "BRT Bus Lines will be displayed here.",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 16), // スペース

              toBuslines_Button(text: "text", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
