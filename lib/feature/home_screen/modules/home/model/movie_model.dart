class MovieModel {
  final int? id;
  final String? title;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final double? rating;

  MovieModel({
    this.id,
    this.title,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.rating,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      mediumCoverImage: json['medium_cover_image'],
      largeCoverImage: json['large_cover_image'],
      rating: (json['rating'] != null)
          ? double.tryParse(json['rating'].toString())
          : null,
    );
  }
}
