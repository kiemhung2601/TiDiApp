class Score {
  String? name;
  double? score;
  String? image;

  Score({this.name, this.score, this.image});

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        name: json['name'],
        score: json['score'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'score': score,
        'image': image,
      };
}
