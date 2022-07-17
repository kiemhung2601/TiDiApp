class News {
  String? idNews;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? publisher;
  int? point;
  int? status;
  String? namePost;
  String? position;
  String? postDate;
  String? numberRegister;

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
    idNews: json['_id'],
    title: json['title'],
    description: json['description'],
    startDate: json['start_date'],
    endDate: json['end_date'],
    publisher: json['publisher'],
    point: json['point'],
    status: json['status'],
    namePost: json['namePost'],
    position: json['position'],
    postDate: json['postDate'],
    numberRegister: json['numberRegister'],
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
    'namePost': namePost,
    'position': position,
    'postDate': postDate,
    'numberRegister': numberRegister,
  };
}