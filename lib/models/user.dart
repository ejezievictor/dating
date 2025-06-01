class User {
  final String id;
  final String name;
  final int age;
  final String? profileImage;
  final String? bio;

  const User({
    required this.id,
    required this.name,
    required this.age,
    this.profileImage,
    this.bio,
  });
}
