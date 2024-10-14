class NoteModel {
  final String title;
  final String description;
  final DateTime createdDate;
  final DateTime? updatedDate;

  const NoteModel({
    required this.title,
    required this.description,
    required this.createdDate,
    this.updatedDate,
  });
}
