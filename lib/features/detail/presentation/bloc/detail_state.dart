part of 'detail_bloc.dart';

class DetailState {
  DetailCryptoStatus detailCryptoStatus;

  DetailState({required this.detailCryptoStatus});

  DetailState copyWith({DetailCryptoStatus? newDetailCryptoStatus}) {
    return DetailState(detailCryptoStatus: newDetailCryptoStatus ?? this.detailCryptoStatus);
  }
}
