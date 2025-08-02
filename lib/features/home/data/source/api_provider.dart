import 'package:crypto_app/core/constants/api_info.dart';
import 'package:dio/dio.dart';

//? https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?  start=1  &  limit=1  &  sortBy=rank  &  sortType=desc  &  convert=USD,BTC,ETH  &  cryptoType=all  &  tagType=all  &  audited=false  &  aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap

class ApiProvider {
  final Dio _dio = Dio();
  final String baseUrl = ApiInfo.baseUrl;

  Future<dynamic> callCryptos() async {
    final response = await _dio.get(
      baseUrl,
      queryParameters: {
        'start': 1,
        'limit': 10,
        'convert': 'USD',
        'sortBy': 'rank',
        'sortType': 'desc',
      },
    );

    return response;
  }
}
