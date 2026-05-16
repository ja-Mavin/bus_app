import 'package:flutter/material.dart';

class toBuslines_Button extends StatelessWidget {
  // 💡 使う場所によって変えたい部分を「変数」にして定義します
  final String text; // ボタンに表示する文字
  final Color backgroundColor; // ボタンの背景色
  final double fontSize; // 文字の大きさ
  final VoidCallback onPressed; // 押したときの処理

  // 💡 コンストラクタ（初期値を設定できます）
  const toBuslines_Button({
    super.key,
    required this.text,
    this.backgroundColor = const Color.fromARGB(255, 82, 176, 243), // 指定しなければ水色
    this.fontSize = 30, // 指定しなければサイズ35
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Mavinさんが作ってくれたコードをそのままここに持ってきました！
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // 💡 変数にする
        minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 65),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      child: Text(
        text, // 💡 変数にする
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize, // 💡 変数にする
        ),
      ),
    );
  }
}
