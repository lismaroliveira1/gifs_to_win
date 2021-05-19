class ImageModel {
  String id;
  String url;
  String username;
  String title;
  String slug;
  String rating;
  String importDateTime;
  String height;
  String width;
  String size;
  String hash;

  ImageModel({
    this.id,
    this.importDateTime,
    this.rating,
    this.slug,
    this.url,
    this.username,
    this.title,
    this.height,
    this.width,
    this.size,
    this.hash,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'username': username,
      'title': title,
      'slug': slug,
      'rating': rating,
      'importDateTime': importDateTime,
      'height': height,
      'width': width,
      'size': size,
      'hash': hash,
    };
  }

  factory ImageModel.fromMap(Map<dynamic, dynamic> map) {
    final imageMapModel = ImageModel(
      id: map['id'],
      url: map['url'],
      username: map['username'],
      title: map['title'],
      slug: map['slug'],
      rating: map['rating'],
      importDateTime: map['importDateTime'],
      height: map['height'],
      width: map['width'],
      size: map['size'],
      hash: map['hash'],
    );
    return imageMapModel;
  }
  factory ImageModel.fromJson(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'],
      url: map['url'],
      username: map['username'],
      title: map['title'],
      slug: map['slug'],
      rating: map['rating'],
      importDateTime: map['importDateTime'],
      height: map['height'],
      width: map['width'],
      size: map['size'],
      hash: map['hash'],
    );
  }
  factory ImageModel.fromDynamic(dynamic map) {
    return ImageModel(
      id: map['id'],
      url: map['url'],
      username: map['username'],
      title: map['title'],
      slug: map['slug'],
      rating: map['rating'],
      importDateTime: map['importDateTime'],
      height: map['height'],
      width: map['width'],
      size: map['size'],
      hash: map['hash'],
    );
  }
}
