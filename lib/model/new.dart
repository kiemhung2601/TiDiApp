class News {
  String? idNews;
  String? title;
  String? detail;
  String? dateOpenRegister;
  String? dateCloseRegister;
  double? score;
  String? namePost;
  String? position;
  String? datePost;
  String? image;
  int? status;
  int? numberRegister;

  News({
    required this.idNews,
    required this.title,
    required this.detail,
    required this.dateOpenRegister,
    required this.dateCloseRegister,
    required this.score,
    required this.namePost,
    required this.position,
    required this.datePost,
    required this.image,
    required this.status,
    required this.numberRegister,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    idNews: json['idNews'],
    title: json['title'],
    detail: json['detail'],
    dateOpenRegister: json['dateOpenRegister'],
    dateCloseRegister: json['dateCloseRegister'],
    score: json['score'],
    namePost: json['namePost'],
    position: json['position'],
    datePost: json['datePost'],
    image: json['image'],
    status: json['status'],
    numberRegister: json['numberRegister'],
  );

  Map<String, dynamic> toJson() => {
    'idNews': idNews,
    'title': title,
    'detail': detail,
    'dateOpenRegister': dateOpenRegister,
    'dateCloseRegister': dateCloseRegister,
    'score': score,
    'namePost': namePost,
    'position': position,
    'datePost': datePost,
    'image': image,
    'status': status,
    'numberRegister': numberRegister,
  };
}
