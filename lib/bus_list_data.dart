class BusStop {
  final String name;      // 英語名
  final String laoName;   // ラオ語名
  final String busNumber; // 路線番号

  BusStop(this.name, this.laoName, this.busNumber);
}

class BusListData {
  static List<BusStop> stops = [
    BusStop('Wattay International Airport', 'ສະໜາມບິນວັດໄຕ', 'Airport Shuttle'),
    BusStop('Sikhay Junction', 'ສີ່ແຍກສີໄຄ', 'Airport Shuttle'),
    BusStop('Fa Ngum Statue', 'ອະນຸສາວະລີ ເຈົ້າຟ້າງຸ່ມ', 'Airport Shuttle'),
    BusStop('Mixay Temple', 'ວັດມີໄຊ', 'Airport Shuttle'),
    BusStop('Nam Phou Fountain', 'ນ້ຳພຸ', 'Airport Shuttle'),
    BusStop('Talat Sao (Central)', 'ຕະຫຼາດເຊົ້າ', 'Airport Shuttle'),
  ];
}