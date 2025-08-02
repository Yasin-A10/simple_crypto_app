import 'package:crypto_app/features/home/domain/entitis/crypto_entity.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CryptoStatus {}

class CryptoLoading extends CryptoStatus {}

class CryptoSuccess extends CryptoStatus {
  final CryptoEntity cryptoEntity;
  CryptoSuccess({required this.cryptoEntity});
}

class CryptoError extends CryptoStatus {
  final String message;
  CryptoError({required this.message});
}