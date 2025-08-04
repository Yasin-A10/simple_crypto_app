import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:crypto_app/features/detail/presentation/bloc/detail_crypto_status.dart';
import 'package:crypto_app/features/detail/presentation/widgets/crypto_area_chart.dart';
import 'package:crypto_app/features/detail/presentation/widgets/crypto_selection_list.dart';
import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';
import 'package:crypto_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DetailScreen extends StatefulWidget {
  final int start;
  const DetailScreen({super.key, required this.start});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailBloc>(context).add(LoadDetailEvent(widget.start));
    BlocProvider.of<HomeBloc>(context).add(LoadCryptoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 20, top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: Icon(
                          Iconsax.arrow_square_left_copy,
                          color: AppColors.myBlack,
                          size: 28,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Trading',
                        style: TextStyle(
                          color: AppColors.myBlack,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
            CryptoSelectionList(start: widget.start),
            SizedBox(height: 12),

            //* Crypto Info
            BlocBuilder<DetailBloc, DetailState>(
              builder: (context, state) {
                if (state.detailCryptoStatus is DetailCryptoLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.detailCryptoStatus is DetailCryptoError) {
                  return Center(
                    child: Text(
                      (state.detailCryptoStatus as DetailCryptoError).message,
                    ),
                  );
                }
                if (state.detailCryptoStatus is DetailCryptoSuccess) {
                  final DetailCryptoSuccess detailCryptoSuccess =
                      state.detailCryptoStatus as DetailCryptoSuccess;
                  final CryptoEntity cryptoEntity =
                      detailCryptoSuccess.cryptoEntity;
                  final cryptoList = cryptoEntity.data?.cryptoCurrencyList;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CachedNetworkImage(
                              fadeInDuration: const Duration(milliseconds: 500),
                              imageUrl:
                                  'https://s2.coinmarketcap.com/static/img/coins/32x32/${cryptoList![0].id}.png',
                              width: 32,
                              height: 32,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cryptoList[0].name!,
                                  style: TextStyle(
                                    color: AppColors.myBlack,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  cryptoList[0].symbol!,
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
                              '${cryptoList[0].quotes?[0].price?.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: AppColors.myBlack,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${cryptoList[0].quotes?[0].price?.toStringAsFixed(2)} ${cryptoList[0].quotes?[0].name}',
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
                  );
                }
                return const SizedBox();
              },
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
    );
  }
}
