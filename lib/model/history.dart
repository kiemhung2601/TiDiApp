class History {
  String? idHistory;
  NewsHistory? newsHistory;
  String? user;
  String? teacher;
  String? admin;
  int? status;

  History(
      {this.idHistory,
      this.newsHistory,
      this.user,
      this.teacher,
      this.admin,
      this.status});

  factory History.fromJson(Map<String, dynamic> json) {
    NewsHistory? newsHistory;
    if(json['event'] != null){
      newsHistory = NewsHistory.fromJson(json['event']);
    }
    return History(
      idHistory: json['_id'],
      newsHistory: newsHistory,
      user: json['user'],
      teacher: json['teacher'],
      admin: json['admin'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': idHistory,
        'newsHistory': newsHistory,
        'user': user,
        'teacher': teacher,
        'admin': admin,
        'status': status,
      };
}

class NewsHistory {
  String? idNews;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? publisher;
  double? point;

  NewsHistory(
      {this.idNews,
        this.title,
        this.description,
        this.startDate,
        this.endDate,
        this.publisher,
      this.point});

  factory NewsHistory.fromJson(Map<String, dynamic> json) => NewsHistory(
    idNews: json['_id'],
    title: json['title'],
    description: json['description'],
    startDate: json['start_date'],
    endDate: json['end_date'],
    publisher: json['publisher'],
    point: json['point'].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    '_id': idNews,
    'title': title,
    'description': description,
    'start_date': startDate,
    'end_date': endDate,
    'publisher': publisher,
    'point': point,
  };
}
