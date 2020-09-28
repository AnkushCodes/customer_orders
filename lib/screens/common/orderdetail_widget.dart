import 'package:customer_order/models/customer_order.dart';
import 'package:flutter/material.dart';

class OrderSpecific extends StatefulWidget {
  final CustomerOrder customerOrder;
  OrderSpecific(this.customerOrder);
  @override
  _OrderSpecificState createState() => _OrderSpecificState(customerOrder);
}

class _OrderSpecificState extends State<OrderSpecific> {
  final CustomerOrder customerOrder;
  _OrderSpecificState(this.customerOrder);
  Size size;

  Widget titleWidget(String name, String value, Icon icon) {
    return Expanded(
      child: ListTile(
          // contentPadding: EdgeInsets.all(0.0),
          //  leading: Container(padding: EdgeInsets.only(left: 5.0)),
          title: Text(
            '$name',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '${value}',
            style: TextStyle(
              color: Color(0xFF801E48),
            ),
            //  overflow: TextOverflow.ellipsis,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: Container(
        color: Colors.amber,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: customerOrder.customerOrders.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                //  viewDialog(context, index);
              },
              child: Container(
                margin: EdgeInsets.only(right: 5.0),
                child: Card(
                  elevation: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          titleWidget(
                              'ID',
                              '${customerOrder.customerOrders[index].order.id}',
                              Icon(Icons.business)),
                          titleWidget(
                              'CustomerId',
                              '${customerOrder.customerOrders[index].order.customerId}',
                              Icon(Icons.business)),
                        ],
                      ),
                      Row(
                        children: [
                          titleWidget(
                              'EmployeeId',
                              '${customerOrder.customerOrders[index].order.employeeId}',
                              Icon(Icons.business)),
                          titleWidget(
                              'ShipVia',
                              '${customerOrder.customerOrders[index].order.shipVia}',
                              Icon(Icons.business)),
                        ],
                      ),
                      Row(
                        children: [
                          titleWidget(
                              'Freight',
                              '${customerOrder.customerOrders[index].order.freight}',
                              Icon(Icons.business)),
                          titleWidget(
                              'ShipName',
                              '${customerOrder.customerOrders[index].order.shipName}',
                              Icon(Icons.business)),
                        ],
                      ),
                      Row(
                        children: [
                          titleWidget(
                              'ShipAddress',
                              '${customerOrder.customerOrders[index].order.shipAddress}',
                              Icon(Icons.business)),
                          titleWidget(
                              'ShipCity',
                              '${customerOrder.customerOrders[index].order.shipCity}',
                              Icon(Icons.business)),
                        ],
                      ),
                      Row(
                        children: [
                          titleWidget(
                              'ShipPostalCode',
                              '${customerOrder.customerOrders[index].order.shipPostalCode}',
                              Icon(Icons.business)),
                          titleWidget(
                              'ShopCountry',
                              '${customerOrder.customerOrders[index].order.shipCountry}',
                              Icon(Icons.business))
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
