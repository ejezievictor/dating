import 'package:dating/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../providers/navigation_provider.dart';
import '../screens/stroll_screen.dart';
import '../screens/discover_screen.dart';
import '../screens/messages_screen.dart';
import '../screens/profile_screen.dart';

class MainNavigation extends ConsumerWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavigationProvider);

    final screens = [
      const StrollScreen(),
      const DiscoverScreen(),
      const MessagesScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0F1115),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              ref.read(bottomNavigationProvider.notifier).state = index;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xFF6B7280),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: _buildNavIconWithSvg(Assets.card, 0, currentIndex),
                label: 'Stroll',
              ),
              BottomNavigationBarItem(
                icon: SizedBox(
                  width: 40,
                  height: 40,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 6,
                        left: 6,
                        child:
                            _buildNavIconWithSvg(Assets.fire, 1, currentIndex),
                      ),
                      Positioned(
                        top: 8,
                        left: 28,
                        child: Container(
                          width: 16,
                          height: 13,
                          padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFB5B2FF),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 1.4,
                              color: const Color(0xFF0F1115),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    _buildNavIconWithSvg(Assets.chats, 2, currentIndex),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Color(0xFFB5B2FF),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '10',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: _buildNavIconWithSvg(Assets.user, 3, currentIndex),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavIconWithSvg(String svgPath, int index, int currentIndex) {
    final isSelected = index == currentIndex;
    return SvgPicture.asset(
      svgPath,
      width: 28,
      height: 28,
      fit: BoxFit.contain,
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.white : const Color(0xFF6B7280),
        BlendMode.srcIn,
      ),
    );
  }
}
