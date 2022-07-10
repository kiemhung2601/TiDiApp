class Notifi {
  String? title;
  String? detail;
  double? score;
  String? dateNotification;
  String? datePost;
  String? dateEnd;
  int? idNews;

  Notifi(
      {required this.title,
      required this.detail,
      required this.score,
      required this.dateNotification,
      required this.datePost,
      required this.dateEnd,
      required this.idNews});

  factory Notifi.fromJson(Map<String, dynamic> json) => Notifi(
        title: json['title'],
        detail: json['detail'],
        score: json['score'],
        dateNotification: json['dateNotification'],
        datePost: json['datePost'],
        dateEnd: json['dateEnd'],
        idNews: json['idNews'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'detail': detail,
        'score': score,
        'dateNotification': dateNotification,
        'datePost': datePost,
        'dateEnd': dateEnd,
        'idNews': idNews,
      };
}
