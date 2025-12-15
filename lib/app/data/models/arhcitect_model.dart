class Architect {
  final int id;
  final String name;
  final String? specialization;
  final String? university;
  final String? country;
  final String? city;
  final String? experience;
  final String? phone;
  final String? languages;
  final int? yearsExperience;
  final String? imageUrl;

  Architect({
    required this.id,
    required this.name,
    this.specialization,
    this.university,
    this.country,
    this.city,
    this.experience,
    this.phone,
    this.languages,
    this.yearsExperience,
    this.imageUrl,
  });

  factory Architect.fromJson(Map<String, dynamic> json) {
    return Architect(
      id: json['id'],
      name: json['name'] ?? '',
      specialization: json['specialization'],
      university: json['university'],
      country: json['country'],
      city: json['city'],
      experience: json['experience'],
      phone: json['phone'],
      languages: json['languages'],
      yearsExperience: json['years_experience'],
      imageUrl: json['img_url']?['image'],
    );
  }
}
