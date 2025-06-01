import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

// Mock current user data
final currentUserProvider = Provider<User>((ref) {
  return const User(
    id: '1',
    name: 'Angelina',
    age: 28,
    profileImage: 'https://example.com/profile.jpg',
    bio: 'Love exploring new places and meeting interesting people.',
  );
});
