import 'package:crypto_app/config/router/route_paths.dart';
import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/features/detail/presentation/screen/detail_screen.dart';
import 'package:crypto_app/features/home/presentation/screen/home_screen.dart';
import 'package:crypto_app/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MainShell extends StatefulWidget {
  final int initialIndex;
  const MainShell({super.key, this.initialIndex = 0});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late final PageController _pageController;
  late int _currentIndex;

  final List<Widget> _tabs = [
    HomeScreen(),
    DetailScreen(),
    ProfileScreen(),
  ];

  final List<String> _paths = [
    RoutePaths.home,
    RoutePaths.crypto,
    RoutePaths.profile,
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavTap(int index) {
    _pageController.jumpToPage(index);
    if (index != _currentIndex) {
      setState(() => _currentIndex = index);
      context.go(_paths[index]);
    }
  }

  void _onPageChanged(int index) {
    if (index != _currentIndex) {
      setState(() => _currentIndex = index);
      context.go(_paths[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const BouncingScrollPhysics(),
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 0
                  ? Iconsax.home
                  : Iconsax.home_1,
              color: _currentIndex == 0 ? AppColors.orange : AppColors.myGrey,
              size: 34,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 2
                  ? Iconsax.bitcoin_convert
                  : Iconsax.bitcoin_convert,
              color: _currentIndex == 2 ? AppColors.orange : AppColors.myGrey,
              size: 34,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _currentIndex == 3
                  ? Iconsax.user
                  : Iconsax.user,
              color: _currentIndex == 3 ? AppColors.orange : AppColors.myGrey,
              size: 34,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
