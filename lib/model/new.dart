class News {
  String? idNews;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? publisher;
  double? point;
  int? status;
  String? namePost;
  String? position;
  String? postDate;
  int? numberRegister;

  News({
    this.idNews,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.publisher,
    this.point,
    this.status,
    this.namePost,
    this.position,
    this.postDate,
    this.numberRegister
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
    idNews: json['_id'] ?? '',
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    startDate: json['start_date'] ?? DateTime.now().toString(),
    endDate: json['end_date'] ?? DateTime.now().toString(),
    publisher: json['publisher'] ?? '',
    point: json['point'] != null ? json['point'].toDouble() : 0.0,
    status: json['status'] ?? -2,
    namePost: json['namepost'] ?? '',
    position: json['position'] ?? '',
    postDate: json['createdAt'] ?? DateTime.now().toString(),
    numberRegister: json['limitReg'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    '_id': idNews,
    'title': title,
    'description': description,
    'start_date': startDate,
    'end_date': endDate,
    'publisher': publisher,
    'point': point,
    'status': status,
    'namepost': namePost,
    'position': position,
    'createdAt': postDate,
    'limitReg': numberRegister,
  };
}