part of 'home_bloc.dart';

class HomeState {
  CryptoStatus cryptoStatus;

  HomeState({required this.cryptoStatus});

  HomeState copyWith({CryptoStatus? newCryptoStatus}) {
    return HomeState(cryptoStatus: newCryptoStatus ?? this.cryptoStatus);
  }
}
