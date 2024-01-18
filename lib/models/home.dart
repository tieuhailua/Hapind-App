class TinderCard {
  final String name;
  final List<String> photos;
  final int age;
  final int km;
  final String? aboutMe;
  final List<String>? interests;
  final String text;

  TinderCard({
    required this.name,
    required this.photos,
    required this.age,
    required this.km,
    this.aboutMe,
    this.interests,
    required this.text
  });
}

