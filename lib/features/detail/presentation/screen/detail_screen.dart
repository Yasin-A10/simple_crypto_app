import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/features/detail/presentation/widgets/crypto_area_chart.dart';
import 'package:crypto_app/features/detail/presentation/widgets/crypto_selection_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trading',
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
              SizedBox(height: 16),

              //* Crypto Selection List
              CryptoSelectionList(),
              SizedBox(height: 12),

              //* Crypto Info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Group16.svg',
                          width: 56,
                          height: 56,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BTC',
                              style: TextStyle(
                                color: AppColors.myBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Bitcoin',
                              style: TextStyle(
                                color: AppColors.myGrey2,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '10,945.00',
                          style: TextStyle(
                            color: AppColors.myBlack,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '1.00 BTC',
                          style: TextStyle(
                            color: AppColors.myGrey2,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),

              //* Crypto Area Chart
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CryptoAreaChart(),
              ),
              SizedBox(height: 32),

              //* Tab Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 52,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.orangeLight,
                          border: Border.all(
                            color: AppColors.backgroundColor,
                            width: 1,
                          ),
                        ),
                        child: TabBar(
                          indicatorColor: AppColors.orange,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorAnimation: TabIndicatorAnimation.elastic,
                          labelColor: AppColors.myBlack,
                          unselectedLabelColor: AppColors.myBlack,
                          unselectedLabelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          dividerHeight: 0,
                          labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.white,
                          ),
                          tabs: [
                            Tab(text: 'Buy'),
                            Tab(text: 'Sell'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        child: TabBarView(
                          children: [
                            Center(child: Text('Buy Tab')),
                            Center(child: Text('Sell Tab')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
