import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/features/home/data/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class CryptoItem extends StatelessWidget {
  final CryptoCurrencyList cryptoCurrency;
  const CryptoItem({
    super.key,
    required this.cryptoCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/crypto', extra: cryptoCurrency.cmcRank);
        print('Crypto Item Tapped: ${cryptoCurrency.cmcRank}');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://s2.coinmarketcap.com/static/img/coins/32x32/${cryptoCurrency.id}.png',
            height: 32,
            width: 32,
            fadeInDuration: const Duration(milliseconds: 500),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${cryptoCurrency.symbol}',
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
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${cryptoCurrency.quotes?[0].price?.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.myBlack,
                ),
              ),
              Text(
                '${cryptoCurrency.quotes?[0].price?.toStringAsFixed(2)} ${cryptoCurrency.quotes?[0].name}',
                style: TextStyle(
                  color: AppColors.myGrey2,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          SizedBox(
            width: 100,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                 (cryptoCurrency.quotes?.first.percentChange30d ?? 0) >= 0 ? AppColors.success200 : AppColors.error200,
                BlendMode.srcIn,
              ),
              child: SvgPicture.network(
                'https://s3.coinmarketcap.com/generated/sparklines/web/30d/2781/${cryptoCurrency.id}.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
