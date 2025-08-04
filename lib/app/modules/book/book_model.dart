class BookModel{
  final String title;
  final String? pdfUrl;
  final String? imageUrl;

  BookModel({required this.title, required this.pdfUrl, required this.imageUrl});

  factory BookModel.fromJson(Map<String, dynamic> json){
    return BookModel(title: json['title'] as String, pdfUrl: json['pdfUrl'] as String?, imageUrl: json['imageUrl'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'pdfUrl': pdfUrl,
      'imageUrl': imageUrl,
    };
  }
}
