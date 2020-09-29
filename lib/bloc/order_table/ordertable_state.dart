import 'package:equatable/equatable.dart';

import 'package:customer_order/models/order_details.dart';

abstract class OrdertableState extends Equatable {
  const OrdertableState();

  @override
  List<Object> get props => [];
}

class OrdertableInitial extends OrdertableState {
  final int pages;
  OrdertableInitial({
    this.pages,
  });
}

enum OrderTableType { loading, success, failure }

class OrdertableSuccessState extends OrdertableState {
  final OrdersDetails orderDetails;
  final bool hasReachedMax;
  final int pages;
  final OrderTableType status;
  OrdertableSuccessState(
      {this.orderDetails,
      this.hasReachedMax = false,
      this.pages = 1,
      this.status});

  OrdertableSuccessState copyWith(
      {OrdersDetails orderDetails,
      bool hasReachedMax,
      int pages,
      final OrderTableType status}) {
    return OrdertableSuccessState(
        orderDetails: orderDetails ?? this.orderDetails,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        pages: pages ?? this.pages,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}

class OrdertableErrorState extends OrdertableState {
  final String error;
  OrdertableErrorState({
    this.error,
  });
}
