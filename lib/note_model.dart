class NoteModel {
  final String title;
  final String content;
  String id;

  NoteModel({
    required this.title,
    required this.content,
    this.id = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      "content": content,
      'id': id,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] as String,
      content: map['content'] as String,
      id: map['id'] as String,
    );
  }

  NoteModel copyWith({
    String? title,
    String? content,
    String? id,
  }) {
    return NoteModel(
      title: title ?? this.title,
      content: content ?? this.content,
      id: id ?? this.id,
    );
  }
}
