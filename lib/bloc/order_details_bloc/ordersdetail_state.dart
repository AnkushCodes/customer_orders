import 'package:customer_order/models/order_details.dart';
import 'package:equatable/equatable.dart';

enum OrderType { initial, success, failure }

class OrdersdetailState extends Equatable {
  final OrderType status;
  final OrdersDetails orderDetails;
  final bool hasReachedMax;
  final int pages;
  const OrdersdetailState(
      {this.status = OrderType.initial,
      this.orderDetails,
      this.hasReachedMax = false,
      this.pages = 1});

  OrdersdetailState copyWith(
      {OrderType status,
      OrdersDetails orderDetails,
      bool hasReachedMax,
      int pages}) {
    return OrdersdetailState(
        status: status ?? this.status,
        orderDetails: orderDetails ?? this.orderDetails,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        pages: pages ?? this.pages);
  }

  @override
  List<Object> get props => [status, orderDetails, hasReachedMax, pages];
}
