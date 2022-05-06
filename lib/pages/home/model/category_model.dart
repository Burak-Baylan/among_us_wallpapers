class CategoryModel {
  String title;
  String link;

  CategoryModel({
    required this.title,
    required this.link,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'] as String,
      link: json['link'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'link': link,
      };

  @override
  String toString() {
    return 'title: $title | link: $link';
  }
}
