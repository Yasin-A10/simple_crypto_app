import 'package:crypto_app/features/home/data/models/crypto_model.dart';
import 'package:crypto_app/features/home/data/source/api_provider.dart';
import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';
import 'package:crypto_app/core/resorce/data_state.dart';
import 'package:crypto_app/features/home/domain/repository/crypto_repository.dart';
import 'package:dio/dio.dart';

class CryptoRepositoryImpl extends CryptoRepository {
  ApiProvider apiProvider;

  CryptoRepositoryImpl({required this.apiProvider});

  @override
  Future<DataState<CryptoEntity>> fetchCryptosData() async {
    try {
      // for loading state from api provider
      Response response = await apiProvider.callCryptos();

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
