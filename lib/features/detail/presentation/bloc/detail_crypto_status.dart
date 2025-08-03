import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';
import 'package:flutter/material.dart';

@immutable
abstract class DetailCryptoStatus {}

class DetailCryptoLoading extends DetailCryptoStatus {}

class DetailCryptoSuccess extends DetailCryptoStatus {
  final CryptoEntity cryptoEntity;
  DetailCryptoSuccess(this.cryptoEntity);
}

class DetailCryptoError extends DetailCryptoStatus {
  final String message;
  DetailCryptoError(this.message);
}