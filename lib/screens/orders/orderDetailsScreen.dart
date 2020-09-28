import 'package:customer_order/bloc/order_details_bloc/ordersdetail_bloc.dart';
import 'package:customer_order/models/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:customer_order/bloc/order_details_bloc/ordersdetail_event.dart';
import 'package:customer_order/bloc/order_details_bloc/ordersdetail_state.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetailsScreen> {
  var _dbloc;
  Size size;
  int page = 1;
  final _scrollController = ScrollController();
  final dataKey = new GlobalKey();
  OrdersDetails ordersDetails;
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(letScroll);
    _dbloc = BlocProvider.of<OrdersdetailBloc>(context);
  }

  void letScroll() {
    if (_isBottom) {
      print(DateTime.now());
      print('addnloc called');
      _dbloc.add(OrderDetailsFetchEvent());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.extentAfter +
        _scrollController.position.maxScrollExtent; //
    final currentScroll = _scrollController.offset;
    // print('object');
    print(currentScroll >= (maxScroll * 0.95));
    return currentScroll >= (maxScroll * 0.96);
  }

  Widget titleWidget(String name, String value) {
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

  GestWidget(OrdersDetails dordersDetails, int _index, BuildContext context) {
    ordersDetails = dordersDetails;
    return GestureDetector(
      onTap: () {
        viewDialog(context, _index);
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
                    '${ordersDetails.results[_index].order.id}',
                  ),
                  titleWidget(
                    'CustomerId',
                    '${ordersDetails.results[_index].order.customerId}',
                  ),
                ],
              ),
              Row(
                children: [
                  titleWidget(
                    'EmployeeId',
                    '${ordersDetails.results[_index].order.employeeId}',
                  ),
                  titleWidget(
                    'ShipVia',
                    '${ordersDetails.results[_index].order.shipVia}',
                  ),
                ],
              ),
              Row(
                children: [
                  titleWidget(
                    'Freight',
                    '${ordersDetails.results[_index].order.freight}',
                  ),
                  titleWidget(
                    'ShipName',
                    '${ordersDetails.results[_index].order.shipName}',
                  ),
                ],
              ),
              Row(
                children: [
                  titleWidget(
                    'ShipAddress',
                    '${ordersDetails.results[_index].order.shipAddress}',
                  ),
                  titleWidget(
                    'ShipCity',
                    '${ordersDetails.results[_index].order.shipCity}',
                  ),
                ],
              ),
              Row(
                children: [
                  titleWidget(
                    'ShipPostalCode',
                    '${ordersDetails.results[_index].order.shipPostalCode}',
                  ),
                  titleWidget(
                    'ShopCountry',
                    '${ordersDetails.results[_index].order.shipCountry}',
                  )
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
  }

  Widget setWidget(String name, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: size.width / 12,
        ),
        Container(
            width: size.width / 3,
            child: Text(
              '$name :',
              // overflow: TextOverflow.,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Container(
            width: size.width / 2.5,
            child: Text(
              '${value}',
              //  overflow: TextOverflow.ellipsis,
            )),
      ],
    );
  }

  Widget dialog_titleWidget(String name, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: size.width / 12,
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: 2.0),
            width: size.width / 3,
            child: Text(
              '$name :',
              // overflow: TextOverflow.,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
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
            backgroundColor: Colors.transparent,
            buttonPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            content: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(4.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xfffffdd0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    width: double.maxFinite,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              height: size.height / 2,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: ordersDetails
                                    .results[dindex].orderDetails.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Order List',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        dialog_titleWidget('OrderId',
                                            '${ordersDetails.results[dindex].orderDetails[index].orderId}'),
                                        dialog_titleWidget('ProductId',
                                            '${ordersDetails.results[dindex].orderDetails[index].productId}'),
                                        dialog_titleWidget('UnitPrice',
                                            '${ordersDetails.results[dindex].orderDetails[index].unitPrice}'),
                                        dialog_titleWidget('Quantity',
                                            '${ordersDetails.results[dindex].orderDetails[index].quantity}'),
                                        dialog_titleWidget('Discount',
                                            '${ordersDetails.results[dindex].orderDetails[index].discount}'),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          )
                        ]),
                  ),
                ),
                Positioned(
                  top: 1.0,
                  right: 1.0,
                  child: Container(
                    decoration: BoxDecoration(

                        // border: Border.all(color: Colors.black),
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(40.0)),
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _dbloc.add(OrderDetailsFetchEvent());
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Orders Details'),
      ),
      body: BlocConsumer<OrdersdetailBloc, OrdersdetailState>(
        listener: (context, state) {
          if (!state.hasReachedMax && _isBottom) {
            _dbloc.add(OrderDetailsFetchEvent());
          }
        },
        builder: (context, state) {
          switch (state.status) {
            case OrderType.failure:
              return const Center(child: Text('failed to fetch posts'));
            case OrderType.success:
              if (state.orderDetails.results.isEmpty) {
                return const Center(child: Text('no posts'));
              }
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  print(index);
                  print(state.orderDetails.results.length);
                  print('////');

                  return index >= state.orderDetails.results.length
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GestWidget(state.orderDetails, index, context);
                },
                itemCount: state.hasReachedMax
                    ? state.orderDetails.results.length
                    : state.orderDetails.results.length + 1,
                controller: _scrollController,
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
