part of 'all_crypto_bloc.dart';

class AllCryptoState {
  AllCryptoStatus allCryptoStatus;

  AllCryptoState({required this.allCryptoStatus});

  AllCryptoState copyWith({AllCryptoStatus? newAllCryptoStatus}) {
    return AllCryptoState(allCryptoStatus: newAllCryptoStatus ?? this.allCryptoStatus);
  }
}
