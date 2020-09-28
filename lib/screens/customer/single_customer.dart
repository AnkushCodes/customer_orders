import 'package:customer_order/values/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:customer_order/bloc/customer_orders_bloc/customerorders_bloc.dart';
import 'package:customer_order/models/customer_order.dart';

class SingleCustomer extends StatefulWidget {
  final String id;
  const SingleCustomer({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _SingleCustomerState createState() => _SingleCustomerState(id);
}

class _SingleCustomerState extends State<SingleCustomer> {
  String id;
  var bloc;
  Size size;
  _SingleCustomerState(this.id);

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CustomerordersBloc>(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    bloc.add(CustomerOrderFetchEvent(customer_order: id));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF801E48),
          title: Text('Customer Orders'),
        ),
        backgroundColor: Colors.grey[300],
        body: BlocBuilder<CustomerordersBloc, CustomerordersState>(
          builder: (context, state) {
            if (state is CustomerordersInitialState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CustomerordersLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CustomerordersSuccesstate) {
              return CustomerOrderView(
                customerOrder: state.customerOrder,
                size: size,
              );
            } else if (state is CustomerorderErrorState) {
              return Center(
                child: Text('Somthing Went wrong'),
              );
            }
            return Center(
              child: Text('Somthing Went wrong'),
            );
          },
        ));
  }
}

class CustomerOrderView extends StatelessWidget {
  final CustomerOrder customerOrder;
  final Size size;
  const CustomerOrderView({Key key, this.customerOrder, this.size})
      : super(key: key);

  Widget titleWidget(String name, String value, Icon icon) {
    return ListTile(
        leading: icon,
        title: Text(
          '$name',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${value}',
          //  overflow: TextOverflow.ellipsis,
        ));

    // Row(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    // Container(
    //   width: size.width / 12,
    // ),
    // Container(
    //     width: size.width / 3,
    //     child: Text(
    //       '$name :',
    //       // overflow: TextOverflow.,
    //       style: TextStyle(fontWeight: FontWeight.bold),
    //     )),
    // Container(
    //     width: size.width / 2.5,
    //     child: Text(
    //       '${value}',
    //       //  overflow: TextOverflow.ellipsis,
    //     )),
    //   ],
    // );
  }

  Widget dialog_titleWidget(String name, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: size.width / 12,
        ),
        Container(
            width: size.width / 4,
            child: Text(
              '$name :',
              // overflow: TextOverflow.,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Container(
            width: size.width / 4,
            child: Text(
              '${value}',
              //  overflow: TextOverflow.ellipsis,
            )),
      ],
    );
  }

  viewDialog(BuildContext context, int dindex) {
    showDialog(
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          buttonPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          content: Stack(
            children: [
              Container(
                color: Colors.grey[100],
                //width: double.maxFinite,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text('Order List')),
                    ],
                  ),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: customerOrder
                          .customerOrders[dindex].orderDetails.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              dialog_titleWidget('orderId',
                                  '${customerOrder.customerOrders[dindex].orderDetails[index].orderId}'),
                              dialog_titleWidget('productId',
                                  '${customerOrder.customerOrders[dindex].orderDetails[index].productId}'),
                              dialog_titleWidget('unitPrice',
                                  '${customerOrder.customerOrders[dindex].orderDetails[index].unitPrice}'),
                              dialog_titleWidget('quantity',
                                  '${customerOrder.customerOrders[dindex].orderDetails[index].quantity}'),
                              dialog_titleWidget('discount',
                                  '${customerOrder.customerOrders[dindex].orderDetails[index].discount}'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ]),
              ),
              Positioned(
                top: -5.0,
                right: -2.0,
                child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print(customerOrder.customerOrders[0].order.freight);
    return SafeArea(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  titleWidget(
                    'ID',
                    customerOrder.customer.id,
                    Icon(Icons.person_outline),
                  ),
                  titleWidget(
                    'COMPANY NAME',
                    customerOrder.customer.companyName,
                    Icon(Icons.business),
                  ),
                  titleWidget(
                    'COMPANY TITLE',
                    customerOrder.customer.contactTitle,
                    Icon(Icons.business_center),
                  ),
                  titleWidget(
                    'ADDRESS',
                    customerOrder.customer.address,
                    Icon(Icons.location_city),
                  ),
                  titleWidget(
                    'CITY',
                    customerOrder.customer.city,
                    Icon(Icons.location_city),
                  ),
                  titleWidget(
                    'POSTALCODE',
                    customerOrder.customer.postalCode,
                    Icon(Icons.edit_location),
                  ),
                  titleWidget(
                    'COUNTRY',
                    customerOrder.customer.country,
                    Icon(Icons.flag),
                  ),
                  titleWidget(
                    'PHONE',
                    customerOrder.customer.phone,
                    Icon(Icons.phone_in_talk),
                  ),
                  titleWidget(
                    'FAX',
                    customerOrder.customer.fax,
                    Icon(Icons.email),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0.5,
              left: 2.0,
              child: MaterialButton(
                  minWidth: size.width - 5,
                  height: 40,
                  color: Color(0xFF801E48),
                  child: Text(
                    'SHOW DETAILS',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesName.order_specific,
                        arguments: customerOrder);
                  }))
        ],
      ),
    );
  }
}
