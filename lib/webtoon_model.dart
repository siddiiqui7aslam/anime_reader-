class Webtoon {
  final String title;
  final String thumbnail;
  final String creator;
  final String genre;
  final String description;

  Webtoon({
    required this.title,
    required this.thumbnail,
    required this.creator,
    required this.genre,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'thumbnail': thumbnail,
      'creator': creator,
      'genre': genre,
      'description': description,
    };
  }

  static Webtoon fromJson(Map<String, dynamic> json) {
    return Webtoon(
      title: json['title'],
      thumbnail: json['thumbnail'],
      creator: json['creator'],
      genre: json['genre'],
      description: json['description'],
    );
  }
}
