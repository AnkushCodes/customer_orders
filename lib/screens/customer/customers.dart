import 'package:customer_order/bloc/customer_bloc/customers_bloc.dart';
import 'package:customer_order/models/customers.dart';
import 'package:customer_order/values/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Customers extends StatefulWidget {
  @override
  _CustomersState createState() => _CustomersState();
}

final spinkit = const SpinKitRotatingPlain(
  color: Colors.white,
  size: 80.0,
);

class _CustomersState extends State<Customers> {
  var bloc;
  Size size;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<CustomersBloc>(context);
    bloc.add(CustomerEventFetch());
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<CustomersBloc, CustomersState>(
        builder: (context, state) {
          if (state is CustomersLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.redAccent,
              ),
            );
          } else if (state is CustomersSuccessState) {
            return CutomerDetails(state.customer, context, size);
          } else if (state is CustomerErrorState) {
            return Center(
              child: Text('Somthing Went wrong'),
            );
          }
          return Center(
            child: Text('Somthing Went wrong'),
          );
        },
      ),
    );
  }
}

class CutomerDetails extends StatelessWidget {
  final Customer customer;
  final BuildContext context;
  final Size size;
  CutomerDetails(this.customer, this.context, this.size);

//   setText({String prefix, String text = "Empty"}) {
//     return Container(
//       height: 50,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//               padding: EdgeInsets.only(left: 20.0), child: Text('${prefix}')),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                   width: MediaQuery.of(context).size.width / 2,
//                   child: Text('${text}')),
//             ],
//           )
//         ],
//       ),
//     );

  cellStructure(String value, {Color colr, String id}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesName.single_customer, arguments: id);
      },
      child: Container(
          decoration: BoxDecoration(
              color: colr ?? Colors.white,
              border: Border(
                  bottom: BorderSide(color: Colors.white, width: 0.5),
                  right: BorderSide(color: Colors.white, width: 0.2))),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 4.5,
          height: MediaQuery.of(context).size.height / 15,
          child: Text(value ?? 'N/A',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: colr != null ? Colors.white : Colors.black,
                fontSize: 10,
                fontWeight:
                    (colr != null ? FontWeight.bold : FontWeight.normal),
              ))),
    );
  }

  List<Widget> setColumn(String str) {
    List<Widget> first_col = [];
    first_col.add(cellStructure(str, colr: Colors.blue));

    if (str.contains('Id')) {
      customer.customers.forEach((value) {
        first_col.add(cellStructure(value.id, colr: Colors.blue, id: value.id));
      });
    } else if (str.contains('CompanyName')) {
      customer.customers.forEach((value) {
        first_col.add(cellStructure(value.companyName, id: value.id));
      });
    } else if (str.contains('ContactTitle')) {
      customer.customers.forEach((value) {
        first_col.add(cellStructure(value.contactName, id: value.id));
      });
    } else if (str.contains('PostalCode')) {
      customer.customers.forEach((value) {
        first_col.add(cellStructure(value.postalCode, id: value.id));
      });
    } else if (str.contains('Country')) {
      customer.customers.forEach((value) {
        first_col.add(cellStructure(value.country, id: value.id));
      });
    } else if (str.contains('Phone')) {
      customer.customers.forEach((value) {
        first_col.add(cellStructure(value.phone, id: value.id));
      });
    } else if (str.contains('Fax')) {
      customer.customers.forEach((value) {
        first_col.add(cellStructure(value.fax, id: value.id));
      });
    }

    return first_col;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: setColumn('Id'),
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: setColumn('ContactTitle')),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: setColumn('CompanyName')),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: setColumn('ContactTitle')),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: setColumn('PostalCode')),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: setColumn('Country')),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: setColumn('Phone')),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: setColumn('Fax')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    // ListView.builder(
    //   itemCount: customer.customers.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         setText(prefix: 'id', text: customer.customers[index].id),
    //         setText(
    //             prefix: 'CompanyName',
    //             text: customer.customers[index].companyName),
    //         setText(
    //             prefix: 'ContactName',
    //             text: customer.customers[index].contactName),
    //         setText(
    //             prefix: 'ContactTitle',
    //             text: customer.customers[index].contactTitle),
    //         setText(prefix: 'City', text: customer.customers[index].city),
    //         setText(
    //             prefix: 'PostalCode',
    //             text: customer.customers[index].postalCode),
    //         setText(prefix: 'Country', text: customer.customers[index].country),
    //         setText(prefix: 'Phone', text: customer.customers[index].phone),
    //         setText(
    //             prefix: 'Fax', text: customer.customers[index].fax ?? 'Empty'),
    //       ],
    //     );
    //   },
    // );
  }
}
