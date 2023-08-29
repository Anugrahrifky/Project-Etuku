// data yang akan diambil //

class cData {
  String ckomoditas;
  String charga;
  String csatuan;
  String cpasar;
  String ctanggal;
  String charga_sebelum;
  String cstatus;

  cData({
    required this.ckomoditas,
    required this.charga,
    required this.csatuan,
    required this.cpasar,
    required this.ctanggal,
    required this.charga_sebelum,
    required this.cstatus,
  });

  factory cData.fromJson(Map<String, dynamic> json) {
    return cData(
        ckomoditas: json['komoditas'],
        charga: json['harga'],
        csatuan: json['satuan'],
        cpasar: json['pasar'],
        ctanggal: json['tanggal'],
        charga_sebelum: json['harga_sebelum'],
        cstatus: json['status']);
  }
}
