import 'package:flutter/material.dart';

class FavoriesItem extends StatefulWidget {
  const FavoriesItem({super.key});

  @override
  State<FavoriesItem> createState() => _FavoriesItemState();
}

class _FavoriesItemState extends State<FavoriesItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDB166E),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "FAVORIES",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
        icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: (){
              
            },
            icon: const Icon(Icons.search))
        ],
      ),

      body: Column(
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
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: SizedBox(
                            width: 342,
                            height: 180,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      "${orders[index].imageOrder}",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                "${orders[index].name}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                "${orders[index].des}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF5F5F5F),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                "${orders[index].viewers} Viewers",
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    ),
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
      required this.viewers,
      required this.timeUp,
      required this.cost});
}

List<OrdersHistory> orders = [
  OrdersHistory(
    imageOrder: "assets/images/Potato.png",
    name: "Awful Potato Bagel",
    des: "Truffle with mashed potato full toping .....",
    start: 4,
    viewers: 223,
    timeUp: "28 Nov 2021 10 : 32 AM",
    cost: "S 332.00",
  ),
  OrdersHistory(
    imageOrder: "assets/images/Breadcrumb.png",
    name: "Breadcrumb Coated Crab Cakes",
    des: "With avocado, red onion and spicy salsa .....",
    start: 4,
    viewers: 223,
    timeUp: "28 Nov 2021 10 : 32 AM",
    cost: "S 332.00",
  ),
  OrdersHistory(
    imageOrder: "assets/images/Salmon.png",
    name: "Smoked Salmon Pasta",
    des: "Smoked salmon with cherry tomatoes, red.....",
    start: 4,
    viewers: 223,
    timeUp: "28 Nov 2021 10 : 32 AM",
    cost: "S 332.00",
  ),
  OrdersHistory(
    imageOrder: "assets/images/Penne.png",
    name: "Penne Arrabbiata",
    des: "Fresh basil, garlic, onions, bell peppers, chili..... ",
    start: 4,
    viewers: 223,
    timeUp: "28 Nov 2021 10 : 32 AM",
    cost: "S 332.00",
  ),
  OrdersHistory(
    imageOrder: "assets/images/Concubine.png",
    name: "Concubine Chicken",
    des: "Sushi Platter | Tuna (2 pcs), Semi-fatty Tuna (2 pcs)",
    start: 4,
    viewers: 223,
    timeUp: "28 Nov 2021 10 : 32 AM",
    cost: "S 332.00",
  ),
  OrdersHistory(
    imageOrder: "assets/images/GingerRed.png",
    name: "Ginger Red Date Cake",
    des: "Lipie, carne pui, cartofi pai,sosuri, salata - 700g",
    start: 4,
    viewers: 223,
    timeUp: "28 Nov 2021 10 : 32 AM",
    cost: "S 332.00",
  ),
];
