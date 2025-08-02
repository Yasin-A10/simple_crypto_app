import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';
import 'package:crypto_app/core/resorce/data_state.dart';

abstract class CryptoRepository {
  Future<DataState<CryptoEntity>> fetchCryptosData();
}