import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TESTVIEW extends StatefulWidget {
  const TESTVIEW({super.key});

  @override
  State<TESTVIEW> createState() => _TESTVIEWState();
}

class _TESTVIEWState extends State<TESTVIEW> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemCount: orders.length,
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                  color: const Color(0xFFEDEDED),
                  height: 1,
                  margin: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ));
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 4,
                      left: 24,
                      right: 24,
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 12,
                          ),
                          child: SizedBox(
                            height: 56,
                            width: 56,
                            child: Center(
                              child: Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${orders[index].imageOrder}"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${orders[index].name}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF000000),
                              ),
                            ),
                            Text(
                              "${orders[index].des}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF5F5F5F),
                              ),
                            ),
                            Text("${orders[index].viewers} Viewers", 
                            style: const TextStyle(fontSize: 12),),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.list_alt),
                        Expanded(
                          child: Text(
                            "28 Nov 2021 10 : 32 AM",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        
                        Text("S 332.00"),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class OrdersHistory {
  final String? imageOrder;
  final String? name;
  final String? des;
  final int? start;
  final int? viewers;
  final String? timeUp;
  final String? cost;

  OrdersHistory(
      {required this.imageOrder,
      required this.name,
      required this.des,
      required this.start,
      required  this.viewers,
      required this.timeUp,
      required this.cost});
}

List<OrdersHistory> orders = [
  OrdersHistory(
    imageOrder: "assets/images/Potato.png",
    name: "Awful Potato Bagel",
    des: "Truffle with mashed potato ",
    start: 4,
    viewers: 223,
    timeUp: "28 Nov 2021 10 : 32 AM",
    cost: "S 332.00",
  ),
  OrdersHistory(
    imageOrder: "assets/images/Breadcrumb.png",
    name: "Awful Potato Bagel",
    des: "Truffle with mashed potato ",
    start: 4,
    viewers: 223,
    timeUp: "28 Nov 2021 10 : 32 AM",
    cost: "S 332.00",
  ),
  OrdersHistory(
    imageOrder: "assets/images/Salmon.png",
    name: "Awful Potato Bagel",
    des: "Truffle with mashed potato ",
    start: 4,
    viewers: 223,
    timeUp: "28 Nov 2021 10 : 32 AM",
    cost: "S 332.00",
  ),
  OrdersHistory(
    imageOrder: "assets/images/Penne.png",
    name: "Awful Potato Bagel",
    des: "Truffle with mashed potato ",
    start: 4,
    viewers: 223,
    timeUp: "28 Nov 2021 10 : 32 AM",
    cost: "S 332.00",
  ),
  OrdersHistory(
    imageOrder: "assets/images/Concubine.png",
    name: "Awful Potato Bagel",
    des: "Truffle with mashed potato ",
    start: 4,
    viewers: 223,
    timeUp: "28 Nov 2021 10 : 32 AM",
    cost: "S 332.00",
  ),
  OrdersHistory(
    imageOrder: "assets/images/GingerRed.png",
    name: "Awful Potato Bagel",
    des: "Truffle with mashed potato ",
    start: 4,
    viewers: 223,
    timeUp: "28 Nov 2021 10 : 32 AM",
    cost: "S 332.00",
  ),
];
