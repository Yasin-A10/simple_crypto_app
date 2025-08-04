import 'package:crypto_app/core/widgets/crypto_item.dart';
import 'package:crypto_app/features/all_crypto/presentation/bloc/all_crypto_bloc.dart';
import 'package:crypto_app/features/all_crypto/presentation/bloc/all_crypto_status.dart';
import 'package:crypto_app/features/home/data/models/crypto_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCryptoScreen extends StatefulWidget {
  const AllCryptoScreen({super.key});

  @override
  State<AllCryptoScreen> createState() => _AllCryptoScreenState();
}

class _AllCryptoScreenState extends State<AllCryptoScreen> {
  final ScrollController _scrollController = ScrollController();
  int start = 1;
  final int limit = 20;

  final List<CryptoCurrencyList> _allCryptos = [];

  @override
  void initState() {
    super.initState();
    context.read<AllCryptoBloc>().add(LoadAllCryptoEvent(start, limit));
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      start += limit;
      context.read<AllCryptoBloc>().add(LoadAllCryptoEvent(start, limit));
    }
  }

  bool get _isBottom {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Crypto')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: BlocListener<AllCryptoBloc, AllCryptoState>(
          listener: (context, state) {
            if (state.allCryptoStatus is AllCryptoSuccess) {
              final cryptoList =
                  (state.allCryptoStatus as AllCryptoSuccess)
                      .cryptoEntity
                      .data
                      ?.cryptoCurrencyList ??
                  [];
              setState(() {
                _allCryptos.addAll(cryptoList);
              });
            }
          },
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount:
                _allCryptos.length +
                ((context.watch<AllCryptoBloc>().state.allCryptoStatus
                        is AllCryptoLoading)
                    ? 1
                    : 0),
            itemBuilder: (context, index) {
              if (index >= _allCryptos.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return CryptoItem(cryptoCurrency: _allCryptos[index]);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 28),
          ),
        ),
      ),
    );
  }
}

// class _AllCryptoScreenState extends State<AllCryptoScreen> {
//   final ScrollController _scrollController = ScrollController();
//   int start = 1;
//   final int limit = 20;
//   final List<CryptoCurrencyList> _allCryptos = [];

//   @override
//   void initState() {
//     super.initState();
//     context.read<AllCryptoBloc>().add(LoadAllCryptoEvent(start, limit));
//     _scrollController.addListener(_onScroll);
//   }

//   void _onScroll() {
//     if (_isBottom) {
//       start += limit;
//       context.read<AllCryptoBloc>().add(LoadAllCryptoEvent(start, limit));
//     }
//   }

//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.offset;
//     return currentScroll >= (maxScroll * 0.9);
//   }

//   @override
//   void dispose() {
//     _scrollController
//       ..removeListener(_onScroll)
//       ..dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('All Crypto')),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         child: BlocBuilder<AllCryptoBloc, AllCryptoState>(
//           builder: (context, state) {
//             // for loading state
//             if (state.allCryptoStatus is AllCryptoLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             // for success state
//             else if (state.allCryptoStatus is AllCryptoSuccess) {
//               //cast cryptoStatus to CryptoSuccess
//               final AllCryptoSuccess allCryptoSuccess =
//                   state.allCryptoStatus as AllCryptoSuccess;
//               final CryptoEntity cryptoEntity = allCryptoSuccess.cryptoEntity;
//               final cryptoList = cryptoEntity.data?.cryptoCurrencyList;
//               _allCryptos.addAll(cryptoList ?? []);

//               return ListView.separated(
//                 key: const PageStorageKey('all_crypto'),
//                 controller: _scrollController,
//                 scrollDirection: Axis.vertical,
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 itemCount: _allCryptos.length,
//                 itemBuilder: (context, index) {
//                   return CryptoItem(cryptoCurrency: _allCryptos[index]);
//                 },
//                 separatorBuilder: (context, index) {
//                   return SizedBox(height: 32);
//                 },
//               );
//             }
//             // for error state
//             else if (state.allCryptoStatus is AllCryptoError) {
//               //cast cryptoStatus to CryptoError
//               final AllCryptoError allCryptoError =
//                   state.allCryptoStatus as AllCryptoError;

//               return Center(
//                 child: Text(
//                   allCryptoError.message,
//                   style: TextStyle(
//                     color: AppColors.error200,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               );
//             }

//             // when state is null
//             return const SizedBox();
//           },
//         ),
//       ),
//     );
//   }
// }
