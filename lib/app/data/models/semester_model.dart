class SemesterModel{
  final String id;
  final String name;

  SemesterModel({required this.id, required this.name});

  factory SemesterModel.fromJson(Map<String, dynamic> json) {
    return SemesterModel(id: json['id'] as String, name: json['name'] as String);
  }

  Map<String, dynamic> toJson() {
    return{
      'id': id,
      'name': name
    };
  }
}