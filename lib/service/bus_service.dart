import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';

import 'dart:convert'; // ← 1. これをファイルの一番上に追加！
import '../model/stops_load_model.dart';

class BusService {
  // どの路線でも使える共通の読み込み関数
  // 引数に「スプレッドシートのURL」を渡すだけ！
  static Future<List<BusStop>> fetchRoute(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      final decodedBody = utf8.decode(response.bodyBytes);

      List<List<dynamic>> csvData = const CsvToListConverter().convert(decodedBody);
      
      // 共通の変換ロジック
      return csvData.skip(1).map((row) {
        return BusStop(
          id: row[0].toString(),
          nameEn: row[1].toString(),
          nameLao: row[2].toString(),
          nameJp: row[3].toString(),
          nameZh: row[4].toString(),
          latitude: double.tryParse(row[5].toString()) ?? 0.0,
          longitude: double.tryParse(row[6].toString()) ?? 0.0,
        );
      }).toList();
    } else {
      throw Exception('データの読み込みに失敗しました');
    }
  }
}