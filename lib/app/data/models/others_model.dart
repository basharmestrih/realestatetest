class OthersModels {
  final int id;
  final String category;
  final String title;
  final String location;
  final String address;
  final List<String> imgUrls;
  final String videoUrl;
  final String description;
  final double price;
  final bool isRent;
  final bool isSell;
  final int? floorsNumber;
  final int? areaDistance;
  final int? arealength;
  final int? areawidth;
  final List<String>? mainFeatures;

  OthersModels({
    required this.id,
    required this.category,
    required this.title,
    required this.location,
    required this.address,
    required this.imgUrls,
    required this.videoUrl,
    required this.description,
    required this.price,
    required this.isRent,
    required this.isSell,
    this.floorsNumber,
    this.areaDistance,
    this.arealength,
    this.areawidth,
    this.mainFeatures,
  });

  factory OthersModels.fromJson(Map<String, dynamic> json) {
    final imgUrlData = json['img_url'] ?? {};
    final List<String> images = List<String>.from(imgUrlData['images'] ?? []);
    final String video = imgUrlData['video']?.toString() ?? '';

    // Safe int parsing function
    int? parseInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is String) return int.tryParse(value);
      return null;
    }

    double parseDouble(dynamic value) {
      if (value == null) return 0.0;
      if (value is double) return value.toDouble();;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    return OthersModels(
      id: parseInt(json['id']) ?? 0,
      category: json['category']?.toString() ?? 'Unknown',
      title: json['title']?.toString() ?? 'Unknown',
      location: json['location']?.toString() ?? 'Unknown',
      address: json['address']?.toString() ?? 'Unknown',
      imgUrls: images,
      videoUrl: video,
      description: json['description']?.toString() ?? '',
      price: parseDouble(json['price']),
      mainFeatures: json['main_features'] != null
          ? List<String>.from(json['main_features'])
          : null,
      areaDistance: parseInt(json['area_distance']),
      arealength: parseInt(json['arealength']),
      areawidth: parseInt(json['areawidth']),
      floorsNumber: parseInt(json['floors_number']),
      isRent: json['is_rent'] ?? false,
      isSell: json['is_sell'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'title': title,
      'location': location,
      'address': address,
      'img_url': {
        'images': imgUrls,
        'video': videoUrl,
      },
      'description': description,
      'price': price,
      'main_features': mainFeatures,
      'area_distance': areaDistance,
      'arealength': arealength,
      'areawidth': areawidth,
      'floors_number': floorsNumber,
      'is_rent': isRent,
      'is_sell': isSell,
    };
  }
}
