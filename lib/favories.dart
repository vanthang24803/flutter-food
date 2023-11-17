// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:food/model/product_model.dart'; // Import model Product
import 'package:food/product_detail.dart';
import 'package:food/service/api.dart';

class FavoriesItem extends StatefulWidget {
  const FavoriesItem({Key? key}) : super(key: key);

  @override
  State<FavoriesItem> createState() => _FavoriesItemState();
}

class _FavoriesItemState extends State<FavoriesItem> {
  late List<Product> products; // List of products from the API

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await API.getProducts();

      setState(() {
        products = response;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDB166E),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            "FAVORITES",
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
            onPressed: () {
              // Handle search action
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 25,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(productId: products[index].id),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                    "${products[index].image}",
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
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              products[index].name,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.end, // Căn phải văn bản
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              products[index].description,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF5F5F5F),
                              ),
                              textAlign: TextAlign.end, // Căn phải văn bản
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Row(
                              children: <Widget>[
                                for (int i = 0; i < 5; i++)
                                  Icon(
                                    Icons.star,
                                    color: i < products[index].star
                                        ? const Color(0xFFDB166E)
                                        : Colors.grey,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
