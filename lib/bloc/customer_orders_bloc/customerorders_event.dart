part of 'customerorders_bloc.dart';

abstract class CustomerordersEvent extends Equatable {
  const CustomerordersEvent();

  @override
  List<Object> get props => [];
}

class CustomerOrderFetchEvent extends CustomerordersEvent {
  final String customer_order;
  CustomerOrderFetchEvent({
    this.customer_order,
  });
}
