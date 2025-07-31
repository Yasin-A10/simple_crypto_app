import 'package:crypto_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoItem extends StatelessWidget {
  final bool slope;
  const CryptoItem({super.key, required this.slope});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: SvgPicture.asset('assets/images/Group16.svg'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BTC',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.myBlack,
              ),
            ),
            Text(
              '+1.6%',
              style: TextStyle(
                color: AppColors.myGrey2,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 60,
          height: 30,
          child: Image.asset('assets/images/chart.png', fit: BoxFit.fill),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '29,850.15',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.myBlack,
              ),
            ),
            Text(
              '47.61 ETH',
              style: TextStyle(
                color: AppColors.myGrey2,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Icon(
          slope ? Iconsax.arrow_circle_up_copy : Iconsax.arrow_circle_down_copy,
          color: slope ? AppColors.success200 : AppColors.error200,
        ),
      ],
    );
  }
}
