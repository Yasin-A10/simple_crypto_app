import 'package:crypto_app/features/home/data/models/crypto_model.dart';
import 'package:crypto_app/features/all_crypto/data/source/all_cryptos_api_provider.dart';
import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';
import 'package:crypto_app/core/resorce/data_state.dart';
import 'package:crypto_app/features/all_crypto/domain/repository/all_crypto_repository.dart';
import 'package:dio/dio.dart';

class AllCryptoRepositoryImpl extends AllCryptoRepository {
  AllCryptosApiProvider allCryptoApiProvider;

  AllCryptoRepositoryImpl(this.allCryptoApiProvider);

  @override
  Future<DataState<CryptoEntity>> fetchAllCryptoData(int start, int limit) async {
    try {
      // for loading state from api provider
      Response response = await allCryptoApiProvider.callAllCryptos(start, limit);

      // for success state
      if (response.statusCode == 200) {
        CryptoEntity cryptoEntity = CryptoModel.fromJson(response.data);
        return DataSuccess(cryptoEntity);
      }
      // for error state
      else {
        return DataFailed('Failed to fetch cryptos data...');
      }
    } catch (e) {
      return DataFailed('Please try again later...');
    }
  }
}
