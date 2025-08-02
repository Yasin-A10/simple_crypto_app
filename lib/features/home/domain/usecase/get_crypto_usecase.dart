import 'package:crypto_app/core/resorce/data_state.dart';
import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';
import 'package:crypto_app/features/home/domain/repository/crypto_repository.dart';

class GetCryptoUseCase {
  CryptoRepository cryptoRepository;
  GetCryptoUseCase({required this.cryptoRepository});

  // for call repository method
  Future<DataState<CryptoEntity>> call() async {
    return await cryptoRepository.fetchCryptosData();
  }
}
