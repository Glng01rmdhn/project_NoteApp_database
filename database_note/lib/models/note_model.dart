class Note {
  int? id;
  String title;
  String content;
  String author;
  String createdAt;
  String updatedAt;

  Note({
    required this.author,
    required this.content,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.id
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tittle': title,
      'content': content,
      'author': author,
      'created_at':  createdAt,
      'updated_at': updatedAt
      
    };
  }

  static fromMap(Map<String, Object?> json) {}
}
