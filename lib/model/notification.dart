class Notifi {
  String? id;
  String? userID;
  String? title;
  String? detail;
  String? dateNotification;
  double? score;

  Notifi({
    this.id,
    this.userID,
    this.title,
    this.detail,
    this.dateNotification,
    this.score,
  });

  factory Notifi.fromJson(Map<String, dynamic> json) => Notifi(
        id: json['_id'] ?? '',
        userID: json['userID'] ?? '',
        title: json['title'] ?? '',
        detail: json['data'] ?? '',
        dateNotification: json['createdAt'] ?? DateTime.now().toString(),
        score: json['swPoint'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userID': userID,
        'title': title,
        'data': detail,
        'createdAt': dateNotification,
        'swPoint': score,
      };
}
