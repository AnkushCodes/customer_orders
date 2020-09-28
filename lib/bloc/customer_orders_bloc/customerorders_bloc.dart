import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:customer_order/api/custom_repo.dart';
import 'package:customer_order/models/customer_order.dart';
import 'package:equatable/equatable.dart';
part 'customerorders_event.dart';
part 'customerorders_state.dart';

class CustomerordersBloc
    extends Bloc<CustomerordersEvent, CustomerordersState> {
  CustomerordersBloc() : super(CustomerordersInitialState());
  CustomerRepo repo;
  @override
  Stream<CustomerordersState> mapEventToState(
    CustomerordersEvent event,
  ) async* {
    repo = CustomerRepo();
    yield CustomerordersLoadingState();
    if (event is CustomerOrderFetchEvent) {
      yield* getData(repo, event.customer_order);
    }
  }

  Stream<CustomerordersState> getData(
      CustomerRepo repo, String customer_orders) async* {
    try {
      CustomerOrder customerOrder =
          await repo.getDataOfSingelUser(customer_orders);
      if (customerOrder == null) {
        yield CustomerorderErrorState();
      } else {
        yield CustomerordersSuccesstate(customerOrder: customerOrder);
      }
    } catch (e) {
      yield CustomerorderErrorState(error: e.message);
    }
  }
}
