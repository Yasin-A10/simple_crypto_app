import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AllCryptoStatus {}

class AllCryptoLoading extends AllCryptoStatus {}

class AllCryptoSuccess extends AllCryptoStatus {
  final CryptoEntity cryptoEntity;
  AllCryptoSuccess(this.cryptoEntity);
}

class AllCryptoError extends AllCryptoStatus {
  final String message;
  AllCryptoError(this.message);
}