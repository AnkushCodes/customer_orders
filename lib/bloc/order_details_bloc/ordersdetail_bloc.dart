import 'dart:async';

import 'package:customer_order/api/order_repo.dart';
import 'package:customer_order/models/customer_order.dart';
import 'package:customer_order/models/order_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ordersdetail_event.dart';
import 'ordersdetail_state.dart';
import 'package:rxdart/rxdart.dart';

class OrdersdetailBloc extends Bloc<OrdersdetailEvent, OrdersdetailState> {
  OrdersdetailBloc() : super(OrdersdetailState());

  @override
  Stream<Transition<OrdersdetailEvent, OrdersdetailState>> transformEvents(
    Stream<OrdersdetailEvent> events,
    TransitionFunction<OrdersdetailEvent, OrdersdetailState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<OrdersdetailState> mapEventToState(
    OrdersdetailEvent event,
  ) async* {
    if (event is OrderDetailsFetchEvent) {
      yield await getData(state);
    }
  }

  addData(OrdersDetails ordersdetail, OrdersdetailState state) {
    ordersdetail.results = ordersdetail.results + state.orderDetails.results;
    return ordersdetail;
  }

  Future<OrdersdetailState> getData(OrdersdetailState state) async {
    if (state.hasReachedMax) return state;
    try {
      OrderRepo repo = OrderRepo();
      if (state.status == OrderType.initial) {
        OrdersDetails ordersdetail =
            await repo.getDataOfOrderDetails('${state.pages}');
        return state.copyWith(
            status: OrderType.success,
            pages: state.pages + 1,
            orderDetails: ordersdetail,
            hasReachedMax: false);
      }

      OrdersDetails ordersdetail =
          await repo.getDataOfOrderDetails('${state.pages}');
      if (ordersdetail != null && ordersdetail.results.isEmpty) {
        return state.copyWith(hasReachedMax: true);
      } else {
        return state.copyWith(
            status: OrderType.success,
            pages: state.pages + 1,
            hasReachedMax: false,
            orderDetails: addData(ordersdetail, state));
      }
    } on Exception {
      return state.copyWith(status: OrderType.failure);
    }
  }
}
