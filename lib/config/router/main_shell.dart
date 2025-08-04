import 'package:crypto_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

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
        // case 1:
        //   context.push('/crypto', extra: 1);
        //   break;
        case 1:
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
    // } else if (location == '/crypto') {
    //   newIndex = 1;
    } else if (location == '/profile') {
      newIndex = 1;
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
            // BottomNavigationBarItem(
            //   icon: Icon(Iconsax.bitcoin_convert_copy, color: AppColors.orange),
            //   activeIcon: Icon(
            //     Iconsax.bitcoin_convert,
            //     color: AppColors.orange,
            //   ),
            //   label: '',
            // ),
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
