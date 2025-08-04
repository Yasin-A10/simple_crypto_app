import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/core/widgets/crypto_item.dart';
import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';
import 'package:crypto_app/features/home/presentation/bloc/crypto_status.dart';
import 'package:crypto_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
                'Top Cryptos',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.myGrey2,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.push('/all_cryptos');
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              // for loading state
              if (state.cryptoStatus is CryptoLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              // for success state
              else if (state.cryptoStatus is CryptoSuccess) {
                //cast cryptoStatus to CryptoSuccess
                final CryptoSuccess cryptoSuccess =
                    state.cryptoStatus as CryptoSuccess;
                final CryptoEntity cryptoEntity = cryptoSuccess.cryptoEntity;
                final cryptoList = cryptoEntity.data?.cryptoCurrencyList;
          
                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: cryptoList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return CryptoItem(cryptoCurrency: cryptoList![index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 28);
                  },
                );
              }
              // for error state
              else if (state.cryptoStatus is CryptoError) {
                //cast cryptoStatus to CryptoError
                final CryptoError cryptoError = state.cryptoStatus as CryptoError;
          
                return Center(
                  child: Text(
                    cryptoError.message,
                    style: TextStyle(
                      color: AppColors.error200,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }
          
              // when state is null
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
