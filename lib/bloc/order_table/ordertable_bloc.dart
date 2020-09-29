import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:customer_order/api/order_repo.dart';
import 'package:customer_order/bloc/order_details_bloc/ordersdetail_bloc.dart';
import 'package:customer_order/bloc/order_details_bloc/ordersdetail_state.dart';
import 'package:customer_order/models/order_details.dart';
import 'ordertable_event.dart';
import 'ordertable_state.dart';

class OrdertableBloc extends Bloc<OrdertableEvent, OrdertableState> {
  OrdertableBloc() : super(OrdertableInitial());

  @override
  Stream<OrdertableState> mapEventToState(
    OrdertableEvent event,
  ) async* {
    try {
      if (event is OrderTableFirstFetchEvent) {
        yield* initData(state);
      } else if (event is OrderTableNextFetchEvent) {
        yield* nextData(state);
      } else if (event is OrderTablePreviousFetchEvent) {
        yield* previousData(state);
      }
    } catch (e) {
      yield OrdertableErrorState(error: e.message);
    }
  }

  Stream<OrdertableState> initData(OrdertableState state) async* {
    try {
      OrderRepo repo = OrderRepo();
      yield OrdertableSuccessState(status: OrderTableType.loading);
      OrdersDetails ordersdetail = await repo.getDataOfOrderDetails('1');
      yield OrdertableSuccessState(
          status: OrderTableType.success,
          hasReachedMax: false,
          orderDetails: ordersdetail,
          pages: 2);
    } catch (e) {
      yield OrdertableErrorState(error: e.message);
    }
  }

  Stream<OrdertableState> nextData(OrdertableState state) async* {
    try {
      OrderRepo repo = OrderRepo();
      yield OrdertableSuccessState(status: OrderTableType.loading);
      OrdersDetails ordersdetail = await repo.getDataOfOrderDetails(
          '${(state as OrdertableSuccessState).pages + 1}');
      if (ordersdetail != null && ordersdetail.results.isEmpty) {
        yield (state as OrdertableSuccessState).copyWith(
            status: OrderTableType.success,
            hasReachedMax: true,
            orderDetails: ordersdetail,
            pages: (state as OrdertableSuccessState).pages);
      } else {
        yield (state as OrdertableSuccessState).copyWith(
            status: OrderTableType.success,
            hasReachedMax: false,
            orderDetails: ordersdetail,
            pages: (state as OrdertableSuccessState).pages);
      }
    } catch (e) {
      yield OrdertableErrorState(error: e.message);
    }
  }

  Stream<OrdertableState> previousData(OrdertableState state) async* {
    try {
      OrderRepo repo = OrderRepo();
      yield OrdertableSuccessState(status: OrderTableType.loading);
      int check = (state as OrdertableSuccessState).pages + 1;
      if (check > 0) {
        OrdersDetails ordersdetail = await repo.getDataOfOrderDetails(
            '${(state as OrdertableSuccessState).pages - 1}');
        yield (state as OrdertableSuccessState).copyWith(
            status: OrderTableType.success,
            hasReachedMax: false,
            orderDetails: ordersdetail,
            pages: (state as OrdertableSuccessState).pages);
      } else {
        initData(state);
      }
    } catch (e) {
      yield OrdertableErrorState(error: e.message);
    }
  }
}
