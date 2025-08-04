import 'package:crypto_app/core/resorce/data_state.dart';
import 'package:crypto_app/features/all_crypto/domain/repository/all_crypto_repository.dart';
import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';

class GetAllCryptoUseCase {
  AllCryptoRepository allCryptoRepository;
  GetAllCryptoUseCase(this.allCryptoRepository);

  // for call detail repository method
  Future<DataState<CryptoEntity>> call(int start, int limit) async {
    return await allCryptoRepository.fetchAllCryptoData(start, limit);
  }
}
