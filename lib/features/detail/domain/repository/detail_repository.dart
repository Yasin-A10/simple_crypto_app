import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';
import 'package:crypto_app/core/resorce/data_state.dart';

abstract class DetailRepository {
  // use in get_detail_usecase
  Future<DataState<CryptoEntity>> fetchDetailData(int start);
}