import 'package:equatable/equatable.dart';

abstract class OrdersdetailEvent extends Equatable {
  const OrdersdetailEvent();

  @override
  List<Object> get props => [];
}

class OrderDetailsFetchEvent extends OrdersdetailEvent {
  OrderDetailsFetchEvent();
}
