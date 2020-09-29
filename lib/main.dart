import 'package:customer_order/bloc/customer_bloc/customers_bloc.dart';
import 'package:customer_order/bloc/customer_orders_bloc/customerorders_bloc.dart';
import 'package:customer_order/router_genrator.dart';
import 'package:customer_order/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/order_details_bloc/ordersdetail_bloc.dart';
import 'bloc/order_table/ordertable_bloc.dart';

void main(List<String> args) {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CustomersBloc>(
          create: (context) => CustomersBloc(),
        ),
        BlocProvider<CustomerordersBloc>(
          create: (context) => CustomerordersBloc(),
        ),
        BlocProvider<OrdertableBloc>(
          create: (context) => OrdertableBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Dashboard(),
          onGenerateRoute: RoureGenrator.genrateRoute),
    );
  }
}
