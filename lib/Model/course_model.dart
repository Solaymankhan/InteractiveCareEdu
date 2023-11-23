class course_model {
  int id;
  String title;
  String thumbnail;

  course_model({
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  factory course_model.fromJson(Map<String, dynamic> json) {
    return course_model(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnail: json['thumbnail'] as String,
    );
  }
}
