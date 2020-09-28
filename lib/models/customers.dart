class Customer {
  List<Customers> customers;
  ResponseStatus responseStatus;

  Customer({this.customers, this.responseStatus});

  Customer.fromJson(Map<String, dynamic> json) {
    if (json['customers'] != null) {
      customers = new List<Customers>();
      json['customers'].forEach((v) {
        customers.add(new Customers.fromJson(v));
      });
    }
    responseStatus = json['responseStatus'] != null
        ? new ResponseStatus.fromJson(json['responseStatus'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customers != null) {
      data['customers'] = this.customers.map((v) => v.toJson()).toList();
    }
    if (this.responseStatus != null) {
      data['responseStatus'] = this.responseStatus.toJson();
    }
    return data;
  }
}

class Customers {
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

  Customers(
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

  Customers.fromJson(Map<String, dynamic> json) {
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

class ResponseStatus {
  String scode;
  ResponseStatus({this.scode});

  ResponseStatus.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
