class CustomerOrder {
  Customera customer;
  List<CustomerOrders> customerOrders;
  ResponseStatus responseStatus;

  CustomerOrder({this.customer, this.customerOrders, this.responseStatus});

  CustomerOrder.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? new Customera.fromJson(json['customer'])
        : null;
    if (json['customerOrders'] != null) {
      customerOrders = new List<CustomerOrders>();
      json['customerOrders'].forEach((v) {
        customerOrders.add(new CustomerOrders.fromJson(v));
      });
    }
    responseStatus = json['responseStatus'] != null
        ? new ResponseStatus.fromJson(json['responseStatus'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    if (this.customerOrders != null) {
      data['customerOrders'] =
          this.customerOrders.map((v) => v.toJson()).toList();
    }
    if (this.responseStatus != null) {
      data['responseStatus'] = this.responseStatus.toJson();
    }
    return data;
  }
}

class Customera {
  String id;
  String companyName;
  String contactName;
  String contactTitle;
  String address;
  String city;
  String postalCode;
  String country;
  String phone;
  String fax;

  Customera(
      {this.id,
      this.companyName,
      this.contactName,
      this.contactTitle,
      this.address,
      this.city,
      this.postalCode,
      this.country,
      this.phone,
      this.fax});

  Customera.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['companyName'];
    contactName = json['contactName'];
    contactTitle = json['contactTitle'];
    address = json['address'];
    city = json['city'];
    postalCode = json['postalCode'];
    country = json['country'];
    phone = json['phone'];
    fax = json['fax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyName'] = this.companyName;
    data['contactName'] = this.contactName;
    data['contactTitle'] = this.contactTitle;
    data['address'] = this.address;
    data['city'] = this.city;
    data['postalCode'] = this.postalCode;
    data['country'] = this.country;
    data['phone'] = this.phone;
    data['fax'] = this.fax;
    return data;
  }
}

class CustomerOrders {
  Order order;
  List<OrderDetails> orderDetails;

  CustomerOrders({this.order, this.orderDetails});

  CustomerOrders.fromJson(Map<String, dynamic> json) {
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
  String shippedDate;
  int shipVia;
  double freight;
  String shipName;
  String shipAddress;
  String shipCity;
  String shipPostalCode;
  String shipCountry;

  Order(
      {this.id,
      this.customerId,
      this.employeeId,
      this.orderDate,
      this.requiredDate,
      this.shippedDate,
      this.shipVia,
      this.freight,
      this.shipName,
      this.shipAddress,
      this.shipCity,
      this.shipPostalCode,
      this.shipCountry});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    employeeId = json['employeeId'];
    orderDate = json['orderDate'];
    requiredDate = json['requiredDate'];
    shippedDate = json['shippedDate'];
    shipVia = json['shipVia'];
    freight = json['freight'];
    shipName = json['shipName'];
    shipAddress = json['shipAddress'];
    shipCity = json['shipCity'];
    shipPostalCode = json['shipPostalCode'];
    shipCountry = json['shipCountry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerId'] = this.customerId;
    data['employeeId'] = this.employeeId;
    data['orderDate'] = this.orderDate;
    data['requiredDate'] = this.requiredDate;
    data['shippedDate'] = this.shippedDate;
    data['shipVia'] = this.shipVia;
    data['freight'] = this.freight;
    data['shipName'] = this.shipName;
    data['shipAddress'] = this.shipAddress;
    data['shipCity'] = this.shipCity;
    data['shipPostalCode'] = this.shipPostalCode;
    data['shipCountry'] = this.shipCountry;
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
