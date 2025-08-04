class DepartmentModel{
  final String id;
  final String name;

  DepartmentModel({
    required this.id,
    required this.name
});

  factory DepartmentModel.fromJson(Map<String, dynamic> json){
    return DepartmentModel(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name' : name
    };
  }
}