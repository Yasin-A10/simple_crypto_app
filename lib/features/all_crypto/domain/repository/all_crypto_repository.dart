import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';
import 'package:crypto_app/core/resorce/data_state.dart';

abstract class AllCryptoRepository {
  // use in get_all_crypto_usecase
  Future<DataState<CryptoEntity>> fetchAllCryptoData(int start, int limit);
}