class Letter {
  final String author;
  final String context;
  final int id;
  final String title;

  Letter({
    required this.author,
    required this.context,
    required this.id,
    required this.title,
  });

  factory Letter.fromJson(Map<String, dynamic> json) {
    return Letter(
      author: json['author'],
      context: json['context'],
      id: json['id'],
      title: json['title'],
    );
  }
}
