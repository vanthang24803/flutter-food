// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food/home.dart';
import 'package:food/model/product_model.dart';
import 'package:food/model/review_model.dart'; // Import model Review
import 'package:food/screen_review.dart';
import 'package:food/service/api.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;

  const ProductDetailPage({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late Product product;
  late Future<List<Review>> reviews;

  @override
  void initState() {
    super.initState();
    fetchProductData();
    fetchReviews();
  }

  Future<void> fetchProductData() async {
    try {
      final data = await API.getProduct(widget.productId);
      setState(() {
        product = data;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> fetchReviews() async {
    try {
      final data = await API.getProductReviews(widget.productId);
      setState(() {
        reviews = Future.value(data);
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    String _formatDate(String dateString) {
      DateTime dateTime = DateTime.parse(dateString);
      return DateFormat('dd/MM/yyyy').format(dateTime);
    }

    

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Product Image
                Center(
                  child: SizedBox(
                    height: 350,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Back Button
                Positioned(
                  top: 20,
                  left: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/vectors/arrow-left.svg',
                      width: 28,
                      height: 28,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                '\$${product.price.toStringAsFixed(2)}', // Hiển thị giá là số với 2 chữ số sau dấu thập phân
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 8),
              child: Row(
                children: <Widget>[
                  for (int i = 0; i < 5; i++)
                    Icon(
                      Icons.star,
                      size: 13,
                      color: i < product.star
                          ? const Color(0xFFDB166E)
                          : Colors.grey,
                    ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  bottom: 10,
                ),
                child: Text(
                  "OPEN IN",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF939393),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    '10:00 - 23:00',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(), // Để tạo khoảng cách giữa Text và Button
                  SizedBox(
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        // Xử lý sự kiện khi nút được nhấn
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFFDB166E), // Màu nền của nút
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.call, // Icon call
                            size: 20, // Kích thước của icon
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Contact',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15, // Màu văn bản của nút
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  bottom: 10,
                ),
                child: Text(
                  "DESCRIPTIONS",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF939393),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(product.description),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  bottom: 10,
                ),
                child: Row(
                  children: [
                    const Text(
                      "DESCRIPTIONS",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF939393),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          'See All Reviews',
                          style: TextStyle(
                            color: Color(0xFFDB166E),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: FutureBuilder<List<Review>>(
                future: reviews,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Review> reviewsData = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int index = 0; index < reviewsData.length; index++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Image.asset(
                                    'assets/images/avt_user.png',
                                    width: 42,
                                    height: 42,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 22,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  reviewsData[index]
                                                      .author
                                                      .username,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 8.0,
                                                  ),
                                                  child: Text(
                                                    _formatDate(
                                                        reviewsData[index]
                                                            .createdAt),
                                                    style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 90,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                for (int i = 0; i < 5; i++)
                                                  Icon(
                                                    Icons.star,
                                                    color: i <
                                                            reviewsData[index]
                                                                .star
                                                        ? const Color(
                                                            0xFFDB166E)
                                                        : Colors.grey,
                                                  ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 280,
                                        child: Text(
                                          reviewsData[index].title,
                                          maxLines: 20,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
