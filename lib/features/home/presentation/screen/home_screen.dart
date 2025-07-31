import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/features/home/presentation/widgets/main_cart.dart';
import 'package:crypto_app/features/home/presentation/widgets/main_crypto_list.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Portfolio',
                    style: TextStyle(
                      color: AppColors.myBlack,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Iconsax.setting_2_copy,
                    color: AppColors.myGrey2,
                    size: 28,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 220,
              child: ListView(
                padding: EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                children: [
                  MainCart(imagePath: 'assets/images/card.png'),
                  SizedBox(width: 16),
                  MainCart(imagePath: 'assets/images/card2.png'),
                ],
              ),
            ),
            SizedBox(height: 8),
            MainCryptoList(),
          ],
        ),
      ),
    );
  }
}
