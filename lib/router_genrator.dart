import 'package:customer_order/screens/common/orderdetail_widget.dart';
import 'package:customer_order/screens/customer/customers.dart';
import 'package:customer_order/screens/customer/single_customer.dart';
import 'package:customer_order/screens/orders/orderDetailsScreen.dart';
import 'package:customer_order/values/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoureGenrator {
  static Route<dynamic> genrateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutesName.customers:
        return CupertinoPageRoute(builder: (_) => Customers());

      case RoutesName.single_customer:
        return CupertinoPageRoute(
          builder: (_) => SingleCustomer(
            id: args,
          ),
        );

      case RoutesName.oreders:
        return CupertinoPageRoute(builder: (_) => OrderDetailsScreen());

      case RoutesName.single_order:
        return CupertinoPageRoute(builder: (_) => Customers());

      case RoutesName.order_specific:
        return CupertinoPageRoute(builder: (_) => OrderSpecific(args));
    }
  }
}
