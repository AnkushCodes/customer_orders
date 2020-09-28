import 'package:customer_order/api/base.dart';
import 'package:customer_order/models/customer_order.dart';
import 'package:customer_order/models/customers.dart';
import 'package:dio/dio.dart';

import 'api.dart';

class CustomerRepo {
  Api api = Api();
  Dio dio = Dio();
  Future<Customer> getDataOfCustomers(String url) async {
    Customer customer;
    try {
      Response response = await api.getReq(url, dio);
      if (response.statusCode == 200) {
        customer = Customer.fromJson(response.data);
      }
      return customer;
    } catch (e) {
      throw e;
    }
  }

  Future<CustomerOrder> getDataOfSingelUser(String url) async {
    CustomerOrder customerOrder;
    String urlSet = '$customresUrl/$url';
    try {
      Response response = await api.getReq(urlSet, dio);
      if (response.statusCode == 200) {
        customerOrder = CustomerOrder.fromJson(response.data);
      }
      return customerOrder;
    } catch (e) {
      throw e;
    }
  }
}
