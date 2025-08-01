import 'package:crypto_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CryptoSelectionList extends StatefulWidget {
  const CryptoSelectionList({super.key});

  @override
  State<CryptoSelectionList> createState() => _CryptoSelectionListState();
}

class _CryptoSelectionListState extends State<CryptoSelectionList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              children: [
                Text(
                  'ETH/USD',
                  style: TextStyle(
                    color: isSelected ? AppColors.orange : AppColors.myGrey2,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 2),
                if (isSelected)
                  Container(width: 60, height: 1.5, color: AppColors.orange),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20),
      ),
    );
  }
}
