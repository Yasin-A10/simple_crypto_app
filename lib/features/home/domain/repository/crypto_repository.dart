import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';
import 'package:crypto_app/core/resorce/data_state.dart';

abstract class CryptoRepository {
  // use in get_crypto_usecase
  Future<DataState<CryptoEntity>> fetchCryptosData();
}