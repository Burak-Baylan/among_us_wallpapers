class ImageModel {
  String? link;

  ImageModel({
    required this.link,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      link: json['link'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'link': link,
      };

  @override
  String toString() {
    return 'link: $link';
  }
}
