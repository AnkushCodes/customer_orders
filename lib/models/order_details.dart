class OrdersDetails {
  List<Results> results;
  ResponseStatus responseStatus;

  OrdersDetails({this.results, this.responseStatus});

  OrdersDetails.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    responseStatus = json['responseStatus'] != null
        ? new ResponseStatus.fromJson(json['responseStatus'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    if (this.responseStatus != null) {
      data['responseStatus'] = this.responseStatus.toJson();
    }
    return data;
  }
}

class Results {
  Order order;
  List<OrderDetails> orderDetails;

  Results({this.order, this.orderDetails});

  Results.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    if (json['orderDetails'] != null) {
      orderDetails = new List<OrderDetails>();
      json['orderDetails'].forEach((v) {
        orderDetails.add(new OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.order != null) {
      data['order'] = this.order.toJson();
    }
    if (this.orderDetails != null) {
      data['orderDetails'] = this.orderDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  int id;
  String customerId;
  int employeeId;
  String orderDate;
  String requiredDate;
  int shipVia;
  double freight;
  String shipName;
  String shipAddress;
  String shipCity;
  String shipRegion;
  String shipPostalCode;
  String shipCountry;
  String shippedDate;

  Order(
      {this.id,
      this.customerId,
      this.employeeId,
      this.orderDate,
      this.requiredDate,
      this.shipVia,
      this.freight,
      this.shipName,
      this.shipAddress,
      this.shipCity,
      this.shipRegion,
      this.shipPostalCode,
      this.shipCountry,
      this.shippedDate});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    employeeId = json['employeeId'];
    orderDate = json['orderDate'];
    requiredDate = json['requiredDate'];
    shipVia = json['shipVia'];
    freight = json['freight'] is double
        ? json['freight']
        : (json['freight']).toDouble();
    shipName = json['shipName'];
    shipAddress = json['shipAddress'];
    shipCity = json['shipCity'];
    shipRegion = json['shipRegion'];
    shipPostalCode = json['shipPostalCode'];
    shipCountry = json['shipCountry'];
    shippedDate = json['shippedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerId'] = this.customerId;
    data['employeeId'] = this.employeeId;
    data['orderDate'] = this.orderDate;
    data['requiredDate'] = this.requiredDate;
    data['shipVia'] = this.shipVia;
    data['freight'] = this.freight;
    data['shipName'] = this.shipName;
    data['shipAddress'] = this.shipAddress;
    data['shipCity'] = this.shipCity;
    data['shipRegion'] = this.shipRegion;
    data['shipPostalCode'] = this.shipPostalCode;
    data['shipCountry'] = this.shipCountry;
    data['shippedDate'] = this.shippedDate;
    return data;
  }
}

class OrderDetails {
  int orderId;
  int productId;
  double unitPrice;
  int quantity;
  double discount;

  OrderDetails(
      {this.orderId,
      this.productId,
      this.unitPrice,
      this.quantity,
      this.discount});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    productId = json['productId'];
    unitPrice = json['unitPrice'] is double
        ? json['unitPrice']
        : (json['unitPrice']).toDouble();
    quantity = json['quantity'];
    discount = json['discount'] is double
        ? json['discount']
        : (json['discount']).toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['productId'] = this.productId;
    data['unitPrice'] = this.unitPrice;
    data['quantity'] = this.quantity;
    data['discount'] = this.discount;
    return data;
  }
}

class ResponseStatus {
  int status;

  ResponseStatus({this.status});

  ResponseStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
