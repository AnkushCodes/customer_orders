import 'package:customer_order/bloc/order_table/ordertable_bloc.dart';
import 'package:customer_order/bloc/order_table/ordertable_state.dart';
import 'package:customer_order/models/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:customer_order/bloc/order_table/ordertable_event.dart';

class OrderTable extends StatefulWidget {
  @override
  _OrderTableState createState() => _OrderTableState();
}

class _OrderTableState extends State<OrderTable> {
  var _bloc;

  Size size;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<OrdertableBloc>(context);
    _bloc.add(OrderTableFirstFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    _bloc.add(OrderTableFirstFetchEvent());
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<OrdertableBloc, OrdertableState>(
          builder: (context, state) {
        if (state is OrdertableInitial) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is OrdertableErrorState) {
          return Center(
            child: Text('${state.error}'),
          );
        }
        if (state is OrdertableSuccessState) {
          switch (state.status) {
            case OrderTableType.loading:
              return Center(
                child: CircularProgressIndicator(),
              );
            case OrderTableType.success:
              return SafeArea(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    state.hasReachedMax
                        ? Center(
                            child: Container(
                            child: Text('Reached Max'),
                          ))
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: tableShow(state.orderDetails)),
                          ),
                    Positioned(
                      left: 0.5,
                      bottom: 0.5,
                      child: state.pages >= 1
                          ? MaterialButton(
                              minWidth: (size.width - 50) / 2,
                              height: 40,
                              color: Color(0xFF801E48),
                              child: Text(
                                'PREVIOUS',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                _bloc.add(OrderTablePreviousFetchEvent());
                              })
                          : Container(
                              width: (size.width - 50) / 2,
                              height: 1.0,
                            ),
                    ),
                    Positioned(
                      bottom: 0.5,
                      right: 0.5,
                      child: (!state.hasReachedMax)
                          ? MaterialButton(
                              minWidth: (size.width - 50) / 2,
                              height: 40,
                              color: Color(0xFF801E48),
                              child: Text(
                                'NEXT',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                _bloc.add(OrderTableNextFetchEvent());
                              })
                          : Container(
                              width: (size.width - 50) / 2,
                              height: 1.0,
                            ),
                    )
                  ],
                ),
              );
          }
        }
        return Container(
          height: 0.0,
          width: 0.0,
        );
      }),
    );
  }

  DataTable tableShow(OrdersDetails orderDetails) {
    List<DataRow> getDataRow(OrdersDetails _orderDetails) {
      List<DataRow> setDataRow = [];
      List<DataCell> setDataCell = [];
      _orderDetails.results.forEach((value) {
        value.orderDetails.forEach((detailVl) {
          setDataCell = [];
          setDataCell.add(DataCell(Text('${detailVl.orderId}')));
          setDataCell.add(DataCell(Text('${detailVl.productId}')));
          setDataCell.add(DataCell(Text('${detailVl.unitPrice}')));
          setDataCell.add(DataCell(Text('${detailVl.quantity}')));
          setDataCell.add(DataCell(Text('${detailVl.discount}')));
          setDataRow.add(DataRow(cells: setDataCell.toList()));
        });
      });
      return setDataRow;
    }

    return DataTable(
        dataRowHeight: 50,
        dividerThickness: 5,
        columns: [
          DataColumn(label: Text('orderId')),
          DataColumn(label: Text('productId')),
          DataColumn(label: Text('unitPrice')),
          DataColumn(label: Text('quantity')),
          DataColumn(label: Text('discount')),
        ],
        rows: getDataRow(orderDetails));
  }
}
