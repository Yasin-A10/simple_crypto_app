// ignore_for_file: use_super_parameters

import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';

class CryptoModel extends CryptoEntity {

  const CryptoModel({Data? data, Status? status}) : super(data: data, status: status);

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      status: json['status'] != null ? Status.fromJson(json['status']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (data != null) {
      json['data'] = data!.toJson();
    }
    if (status != null) {
      json['status'] = status!.toJson();
    }
    return json;
  }
}

class Data {
  List<CryptoCurrencyList>? cryptoCurrencyList;
  String? totalCount;

  Data({this.cryptoCurrencyList, this.totalCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cryptoCurrencyList'] != null) {
      cryptoCurrencyList = <CryptoCurrencyList>[];
      json['cryptoCurrencyList'].forEach((v) {
        cryptoCurrencyList!.add(CryptoCurrencyList.fromJson(v));
      });
    }
    totalCount = json['totalCount']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (cryptoCurrencyList != null) {
      json['cryptoCurrencyList'] =
          cryptoCurrencyList!.map((v) => v.toJson()).toList();
    }
    if (totalCount != null) {
      json['totalCount'] = totalCount;
    }
    return json;
  }
}

class CryptoCurrencyList {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? cmcRank;
  int? marketPairCount;
  double? circulatingSupply;
  int? selfReportedCirculatingSupply;
  double? totalSupply;
  double? maxSupply;
  double? ath;
  double? atl;
  double? high24h;
  double? low24h;
  int? isActive;
  String? lastUpdated;
  String? dateAdded;
  List<Quotes>? quotes;
  bool? isAudited;
  List<dynamic>? auditInfoList;
  List<int>? badges;

  CryptoCurrencyList({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.cmcRank,
    this.marketPairCount,
    this.circulatingSupply,
    this.selfReportedCirculatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.atl,
    this.high24h,
    this.low24h,
    this.isActive,
    this.lastUpdated,
    this.dateAdded,
    this.quotes,
    this.isAudited,
    this.auditInfoList,
    this.badges,
  });

  CryptoCurrencyList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    cmcRank = json['cmcRank'];
    marketPairCount = json['marketPairCount'];
    circulatingSupply = (json['circulatingSupply'] as num?)?.toDouble();
    selfReportedCirculatingSupply = json['selfReportedCirculatingSupply'];
    totalSupply = json['totalSupply'];
    maxSupply = json['maxSupply'];
    ath = (json['ath'] as num?)?.toDouble();
    atl = (json['atl'] as num?)?.toDouble();
    high24h = (json['high24h'] as num?)?.toDouble();
    low24h = (json['low24h'] as num?)?.toDouble();
    isActive = json['isActive'];
    lastUpdated = json['lastUpdated'];
    dateAdded = json['dateAdded'];
    if (json['quotes'] != null) {
      quotes = <Quotes>[];
      json['quotes'].forEach((v) {
        quotes!.add(Quotes.fromJson(v));
      });
    }
    isAudited = json['isAudited'];
    auditInfoList = json['auditInfoList'] != null ? List.from(json['auditInfoList']) : null;
    badges = json['badges'] != null ? List<int>.from(json['badges']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (id != null) json['id'] = id;
    if (name != null) json['name'] = name;
    if (symbol != null) json['symbol'] = symbol;
    if (slug != null) json['slug'] = slug;
    if (cmcRank != null) json['cmcRank'] = cmcRank;
    if (marketPairCount != null) json['marketPairCount'] = marketPairCount;
    if (circulatingSupply != null) json['circulatingSupply'] = circulatingSupply;
    if (selfReportedCirculatingSupply != null) json['selfReportedCirculatingSupply'] = selfReportedCirculatingSupply;
    if (totalSupply != null) json['totalSupply'] = totalSupply;
    if (maxSupply != null) json['maxSupply'] = maxSupply;
    if (ath != null) json['ath'] = ath;
    if (atl != null) json['atl'] = atl;
    if (high24h != null) json['high24h'] = high24h;
    if (low24h != null) json['low24h'] = low24h;
    if (isActive != null) json['isActive'] = isActive;
    if (lastUpdated != null) json['lastUpdated'] = lastUpdated;
    if (dateAdded != null) json['dateAdded'] = dateAdded;
    if (quotes != null) json['quotes'] = quotes!.map((v) => v.toJson()).toList();
    if (isAudited != null) json['isAudited'] = isAudited;
    if (auditInfoList != null) json['auditInfoList'] = auditInfoList;
    if (badges != null) json['badges'] = badges;
    return json;
  }
}

class Quotes {
  String? name;
  double? price;
  double? volume24h;
  double? volume7d;
  double? volume30d;
  double? marketCap;
  double? selfReportedMarketCap;
  double? percentChange1h;
  double? percentChange24h;
  double? percentChange7d;
  String? lastUpdated;
  double? percentChange30d;
  double? percentChange60d;
  double? percentChange90d;
  double? fullyDilluttedMarketCap;
  double? marketCapByTotalSupply;
  double? dominance;
  double? turnover;
  double? ytdPriceChangePercentage;
  double? percentChange1y;

  Quotes({
    this.name,
    this.price,
    this.volume24h,
    this.volume7d,
    this.volume30d,
    this.marketCap,
    this.selfReportedMarketCap,
    this.percentChange1h,
    this.percentChange24h,
    this.percentChange7d,
    this.lastUpdated,
    this.percentChange30d,
    this.percentChange60d,
    this.percentChange90d,
    this.fullyDilluttedMarketCap,
    this.marketCapByTotalSupply,
    this.dominance,
    this.turnover,
    this.ytdPriceChangePercentage,
    this.percentChange1y,
  });

  Quotes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = (json['price'] as num?)?.toDouble();
    volume24h = (json['volume24h'] as num?)?.toDouble();
    volume7d = (json['volume7d'] as num?)?.toDouble();
    volume30d = (json['volume30d'] as num?)?.toDouble();
    marketCap = (json['marketCap'] as num?)?.toDouble();
    selfReportedMarketCap = (json['selfReportedMarketCap'] as num?)?.toDouble();
    percentChange1h = (json['percentChange1h'] as num?)?.toDouble();
    percentChange24h = (json['percentChange24h'] as num?)?.toDouble();
    percentChange7d = (json['percentChange7d'] as num?)?.toDouble();
    lastUpdated = json['lastUpdated'];
    percentChange30d = (json['percentChange30d'] as num?)?.toDouble();
    percentChange60d = (json['percentChange60d'] as num?)?.toDouble();
    percentChange90d = (json['percentChange90d'] as num?)?.toDouble();
    fullyDilluttedMarketCap = (json['fullyDilluttedMarketCap'] as num?)?.toDouble();
    marketCapByTotalSupply = (json['marketCapByTotalSupply'] as num?)?.toDouble();
    dominance = (json['dominance'] as num?)?.toDouble();
    turnover = (json['turnover'] as num?)?.toDouble();
    ytdPriceChangePercentage = (json['ytdPriceChangePercentage'] as num?)?.toDouble();
    percentChange1y = (json['percentChange1y'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (name != null) json['name'] = name;
    if (price != null) json['price'] = price;
    if (volume24h != null) json['volume24h'] = volume24h;
    if (volume7d != null) json['volume7d'] = volume7d;
    if (volume30d != null) json['volume30d'] = volume30d;
    if (marketCap != null) json['marketCap'] = marketCap;
    if (selfReportedMarketCap != null) json['selfReportedMarketCap'] = selfReportedMarketCap;
    if (percentChange1h != null) json['percentChange1h'] = percentChange1h;
    if (percentChange24h != null) json['percentChange24h'] = percentChange24h;
    if (percentChange7d != null) json['percentChange7d'] = percentChange7d;
    if (lastUpdated != null) json['lastUpdated'] = lastUpdated;
    if (percentChange30d != null) json['percentChange30d'] = percentChange30d;
    if (percentChange60d != null) json['percentChange60d'] = percentChange60d;
    if (percentChange90d != null) json['percentChange90d'] = percentChange90d;
    if (fullyDilluttedMarketCap != null) json['fullyDilluttedMarketCap'] = fullyDilluttedMarketCap;
    if (marketCapByTotalSupply != null) json['marketCapByTotalSupply'] = marketCapByTotalSupply;
    if (dominance != null) json['dominance'] = dominance;
    if (turnover != null) json['turnover'] = turnover;
    if (ytdPriceChangePercentage != null) json['ytdPriceChangePercentage'] = ytdPriceChangePercentage;
    if (percentChange1y != null) json['percentChange1y'] = percentChange1y;
    return json;
  }
}

class Status {
  String? timestamp;
  String? errorCode;
  String? errorMessage;
  String? elapsed;
  int? creditCount;

  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
  });

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code']?.toString();
    errorMessage = json['error_message'];
    elapsed = json['elapsed']?.toString();
    creditCount = json['credit_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (timestamp != null) json['timestamp'] = timestamp;
    if (errorCode != null) json['error_code'] = errorCode;
    if (errorMessage != null) json['error_message'] = errorMessage;
    if (elapsed != null) json['elapsed'] = elapsed;
    if (creditCount != null) json['credit_count'] = creditCount;
    return json;
  }
}
