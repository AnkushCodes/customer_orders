import 'package:customer_order/models/order_details.dart';
import 'package:dio/dio.dart';

import 'api.dart';

class OrderRepo {
  Dio dio = Dio();
  Api api = Api();
  Future<OrdersDetails> getDataOfOrderDetails(String url) async {
    OrdersDetails ordersDetails;
    try {
      String urls = 'orders/page/' + url;
      Response response = await api.getReq(urls, dio);

      ordersDetails = OrdersDetails.fromJson(response.data);

      return ordersDetails;
    } catch (e) {
      throw e;
    }
  }
}
