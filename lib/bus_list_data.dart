class BusStop {
  final String enName;    // 英語名
  final String laoName;   // ラオ語名
  final String jpName;    // 日本語名
  final int stopsId; // 停留所番号
  final String lineNumber; // 路線番号

  BusStop(this.enName, this.laoName, this.jpName, this.stopsId, this.lineNumber);
}

class BusListData {
  static List<BusStop> stops = [
    BusStop('Wattay International Airport', 'ສະໜາມບິນວັດໄຕ', 'ワットタイ国際空港', 1, 'Airport Shuttle'),
    BusStop('Sikhay Junction', 'ສີ່ແຍກສີໄຄ', 'シカイ・ジャンクション', 2, 'Airport Shuttle'),
    BusStop('Fa Ngum Statue', 'ອະນຸສາວະລີ ເຈົ້າຟ້າງຸ່ມ', 'ファ・ングム像', 3, 'Airport Shuttle'),
    BusStop('Mixay Temple', 'ວັດມີໄຊ', 'ミサイ寺', 4, 'Airport Shuttle'),
    BusStop('Nam Phou Fountain', 'ນ້ຳພຸ', 'ナンプー噴水広場', 5, 'Airport Shuttle'),
    BusStop('Talat Sao (CBS)', 'ຕະຫຼາດເຊົ້າ', 'タラート・サオ（中央）', 6, 'Airport Shuttle'),
  ];
}