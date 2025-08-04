import 'package:crypto_app/core/constants/api_info.dart';
import 'package:dio/dio.dart';

//? https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?  start=1  &  limit=1  &  sortBy=rank  &  sortType=desc  &  convert=USD,BTC,ETH  &  cryptoType=all  &  tagType=all  &  audited=false  &  aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap

class AllCryptosApiProvider {
  final Dio _dio = Dio();
  final String baseUrl = ApiInfo.baseUrl;

  Future<dynamic> callAllCryptos(int start, int limit) async {
    final response = await _dio.get(
      baseUrl,
      queryParameters: {
        'start': start,
        'limit': limit,
        'sortBy': 'rank',
        'sortType': 'desc',
        'convert': 'USD',
      },
    );

    return response;
  }
}
