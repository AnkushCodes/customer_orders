part of 'customerorders_bloc.dart';

abstract class CustomerordersState extends Equatable {
  const CustomerordersState();

  @override
  List<Object> get props => [];
}

class CustomerordersInitialState extends CustomerordersState {}

class CustomerordersLoadingState extends CustomerordersState {}

class CustomerordersSuccesstate extends CustomerordersState {
  final CustomerOrder customerOrder;
  CustomerordersSuccesstate({
    this.customerOrder,
  });
}

class CustomerorderErrorState extends CustomerordersState {
  final String error;
  CustomerorderErrorState({
    this.error,
  });
}
