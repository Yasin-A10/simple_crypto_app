part of 'detail_bloc.dart';

// import 'package:flutter/material.dart';

// @immutable
abstract class DetailEvent {}

class LoadDetailEvent extends DetailEvent {
  final int start;
  LoadDetailEvent(this.start);
}