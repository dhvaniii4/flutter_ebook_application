import '../../../utils/import_export.dart';

class SubjectModel {
  final String id;
  final String name;

  SubjectModel({required this.id, required this.name});

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(id: json['id'] as String, name: json['name'] as String);
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      // 'books': books.map((book) => book.toJson()).toList(),
    };
  }
}
