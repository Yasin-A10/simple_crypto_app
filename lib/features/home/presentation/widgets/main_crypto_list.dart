import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/crypto_item.dart';
import 'package:flutter/material.dart';

class MainCryptoList extends StatelessWidget {
  const MainCryptoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Charts',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.myGrey2,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 350,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              CryptoItem(slope: true),
              SizedBox(height: 28),
              CryptoItem(slope: false),
              SizedBox(height: 28),
              CryptoItem(slope: true),
              SizedBox(height: 28),
              CryptoItem(slope: false),
            ],
          ),
        ),
      ],
    );
  }
}
