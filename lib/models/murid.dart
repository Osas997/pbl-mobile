class Murid {
  String nisn;
  String namaMurid;
  String kelas;
  String jenisKelamin;
  String idSekolah;

  Murid({
    required this.nisn,
    required this.namaMurid,
    required this.kelas,
    required this.jenisKelamin,
    required this.idSekolah,
  });

  factory Murid.fromJson(Map<String, dynamic> json) {
    return Murid(
      nisn: json['nisn'].toString(),
      namaMurid: json['nama_murid'].toString(),
      kelas: json['kelas'].toString(),
      jenisKelamin: json['jenis_kelamin'].toString(),
      idSekolah: json['id_sekolah'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nisn': nisn,
      'nama_murid': namaMurid,
      'kelas': kelas,
      'jenis_kelamin': jenisKelamin,
      'id_sekolah': idSekolah,
    };
  }
}
