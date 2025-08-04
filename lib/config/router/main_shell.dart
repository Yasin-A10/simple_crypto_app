import 'package:crypto_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

// class MainShell extends StatefulWidget {
//   final int initialIndex;
//   const MainShell({super.key, this.initialIndex = 0});

//   @override
//   State<MainShell> createState() => _MainShellState();
// }

// class _MainShellState extends State<MainShell> {
//   late final PageController _pageController;
//   late int _currentIndex;

//   final List<Widget> _tabs = [HomeScreen(), DetailScreen(start: 1), ProfileScreen()];

//   final List<String> _paths = [
//     RoutePaths.home,
//     RoutePaths.crypto,
//     RoutePaths.profile,
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = widget.initialIndex;
//     _pageController = PageController(initialPage: _currentIndex);
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   void _onNavTap(int index) {
//     _pageController.jumpToPage(index);
//     if (index != _currentIndex) {
//       setState(() => _currentIndex = index);
//       context.push(_paths[index]);
//     }
//   }

//   void _onPageChanged(int index) {
//     if (index != _currentIndex) {
//       setState(() => _currentIndex = index);
//       context.push(_paths[index]);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: _onPageChanged,
//         physics: const BouncingScrollPhysics(),
//         children: _tabs,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onNavTap,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               _currentIndex == 0 ? Iconsax.home_2 : Iconsax.home_2_copy,
//               color: _currentIndex == 0 ? AppColors.orange : AppColors.myGrey,
//               size: 24,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               _currentIndex == 1
//                   ? Iconsax.bitcoin_convert
//                   : Iconsax.bitcoin_convert_copy,
//               color: _currentIndex == 1 ? AppColors.orange : AppColors.myGrey,
//               size: 24,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               _currentIndex == 2 ? Iconsax.user : Iconsax.user_copy,
//               color: _currentIndex == 2 ? AppColors.orange : AppColors.myGrey,
//               size: 24,
//             ),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }

// main shell
class RootScreen extends StatefulWidget {
  final Widget child;

  const RootScreen({super.key, required this.child});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          context.push('/home');
          break;
        case 1:
          context.push('/crypto', extra: 1);
          break;
        case 2:
          context.push('/profile');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).state.uri.toString();

    int newIndex = 0;

    if (location == '/home') {
      newIndex = 0;
    } else if (location == '/crypto') {
      newIndex = 1;
    } else if (location == '/profile') {
      newIndex = 2;
    }

    if (newIndex != _currentIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _currentIndex = newIndex;
        });
      });
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home_2_copy, color: AppColors.orange),
              activeIcon: Icon(Iconsax.home_2, color: AppColors.orange),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.bitcoin_convert_copy, color: AppColors.orange),
              activeIcon: Icon(
                Iconsax.bitcoin_convert,
                color: AppColors.orange,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user_copy, color: AppColors.orange),
              activeIcon: Icon(Iconsax.user, color: AppColors.orange),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
