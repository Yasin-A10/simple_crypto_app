import 'package:crypto_app/features/home/data/models/crypto_model.dart';
import 'package:equatable/equatable.dart';

class CryptoEntity extends Equatable {
  final Data? data;
  final Status? status;

  const CryptoEntity({this.data, this.status});

  @override
  List<Object?> get props => [data, status];
}