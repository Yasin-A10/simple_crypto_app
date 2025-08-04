part of 'all_crypto_bloc.dart';

// import 'package:flutter/material.dart';

// @immutable
abstract class AllCryptoEvent {}

class LoadAllCryptoEvent extends AllCryptoEvent {
  final int start;
  final int limit;
  LoadAllCryptoEvent(this.start, this.limit);
}