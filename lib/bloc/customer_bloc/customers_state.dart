part of 'customers_bloc.dart';

abstract class CustomersState extends Equatable {
  const CustomersState();
  @override
  List<Object> get props => [];
}

class CustomersInitial extends CustomersState {}

class CustomersLoadingState extends CustomersState {}

class CustomersSuccessState extends CustomersState {
  final Customer customer;
  CustomersSuccessState({this.customer});
}

class CustomerErrorState extends CustomersState {
  final String error;
  CustomerErrorState({
    this.error,
  });
}
