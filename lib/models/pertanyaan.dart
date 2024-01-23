class Pertanyaan {
  int? id;
  String? pertanyaan;
  String? tipePertanyaan;
  String? tipePerilaku;
  String? createdAt;
  String? updatedAt;

  Pertanyaan(
      {this.id,
      this.pertanyaan,
      this.tipePertanyaan,
      this.tipePerilaku,
      this.createdAt,
      this.updatedAt});

  Pertanyaan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pertanyaan = json['pertanyaan'];
    tipePertanyaan = json['tipe_pertanyaan'];
    tipePerilaku = json['tipe_perilaku'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
