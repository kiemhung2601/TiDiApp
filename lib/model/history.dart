class History {
  String? title;
  String? detail;
  String? image;
  double? score;
  int? type;
  int? idNews;

  History(
      {this.title,
      this.detail,
      this.image,
      this.score,
      this.type,
      this.idNews});

  factory History.fromJson(Map<String, dynamic> json) => History(
        title: json['title'],
        detail: json['detail'],
        image: json['image'],
        score: json['score'],
        type: json['type'],
        idNews: json['idNews'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'detail': detail,
        'image': image,
        'score': score,
        'type': type,
        'idNews': idNews,
      };
}
