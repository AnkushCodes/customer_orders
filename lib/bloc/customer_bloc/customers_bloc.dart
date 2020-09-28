import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:customer_order/api/base.dart';
import 'package:customer_order/api/custom_repo.dart';
import 'package:customer_order/models/customers.dart';
import 'package:equatable/equatable.dart';

part 'customers_event.dart';
part 'customers_state.dart';

class CustomersBloc extends Bloc<CustomersEvent, CustomersState> {
  CustomersBloc() : super(CustomersInitial());
  CustomerRepo repo;
  @override
  Stream<CustomersState> mapEventToState(
    CustomersEvent event,
  ) async* {
    yield CustomersLoadingState();
    repo = CustomerRepo();
    if (event is CustomerEventFetch) {
      yield* getData(repo);
    }
  }

  Stream<CustomersState> getData(CustomerRepo repo) async* {
    try {
      Customer customer = await repo.getDataOfCustomers(customresUrl);
      if (customer == null) {
        yield CustomerErrorState();
      } else {
        yield CustomersSuccessState(customer: customer);
      }
    } catch (e) {
      yield CustomerErrorState(error: e.message);
    }
  }
}
