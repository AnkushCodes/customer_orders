import 'package:customer_order/values/routes.dart';
import 'package:flutter/material.dart';

import 'common/card_tile.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Color(0xFFFAEBD7).withOpacity(0.6)),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            SizedBox(
              height: size.height / 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.customers),
                    child: CardTile("Customers", Colors.redAccent)),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.oreders);
                    },
                    child: CardTile("Orders", Colors.blue)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
