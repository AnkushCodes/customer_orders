import 'package:equatable/equatable.dart';

abstract class OrdertableEvent extends Equatable {
  const OrdertableEvent();

  @override
  List<Object> get props => [];
}

class OrderTableFirstFetchEvent extends OrdertableEvent {}

class OrderTableNextFetchEvent extends OrdertableEvent {}

class OrderTablePreviousFetchEvent extends OrdertableEvent {}
