import 'package:crypto_app/core/constants/colors.dart';
import 'package:crypto_app/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:crypto_app/features/home/presentation/bloc/crypto_status.dart';
import 'package:crypto_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoSelectionList extends StatefulWidget {
  final int start;
  const CryptoSelectionList({super.key, required this.start});

  @override
  State<CryptoSelectionList> createState() => _CryptoSelectionListState();
}

class _CryptoSelectionListState extends State<CryptoSelectionList> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedIndex = widget.start - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.cryptoStatus is CryptoSuccess) {
            final CryptoSuccess cryptoSuccess =
                state.cryptoStatus as CryptoSuccess;
            final cryptoList =
                cryptoSuccess.cryptoEntity.data?.cryptoCurrencyList;

            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: cryptoList!.length,
              itemBuilder: (context, index) {
                final isSelected = index == selectedIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = cryptoList[index].cmcRank! - 1;
                      BlocProvider.of<DetailBloc>(
                        context,
                      ).add(LoadDetailEvent(cryptoList[index].cmcRank!));
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        '${cryptoList[index].symbol}/USD',
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.orange
                              : AppColors.myGrey2,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 2),
                      if (isSelected)
                        Container(
                          width: 60,
                          height: 1.5,
                          color: AppColors.orange,
                        ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
            );
          }
          if (state.cryptoStatus is CryptoError) {
            final CryptoError cryptoError = state.cryptoStatus as CryptoError;
            return Center(child: Text(cryptoError.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
