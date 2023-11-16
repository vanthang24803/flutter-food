// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food/book_table.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 350,
                child: Image.asset("assets/images/shipper.png"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Boneless Sour and Spicy Chicken ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                'Sushi Platter | Tuna (2 pcs), ',
                style: TextStyle(
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
                      color: i < 4 ? const Color(0xFFDB166E) : Colors.grey,
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
                        primary: const Color(0xFFDB166E), // Màu nền của nút
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
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                  'Food is scrumptious, delicious, delectable, luscious, '
                  'great tasting, much more than tasty, really appetizing, '
                  'lip-smacking; the kind of food to have you licking your '
                  'lips in anticipation. This is the word everyone wants to '
                  'hear when bringing food to the table. Yummy food is '
                  'never unpalatable, plain tasting, distasteful or '
                  'disgusting. View more'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: reviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = reviews[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Image.asset(
                                data.imgUserName,
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
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.userName,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                data.time,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w800,
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
                                                color: i < data.star
                                                    ? const Color(0xFFDB166E)
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
                                      data.review,
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Review {
  final String userName;
  final String time;
  final String imgUserName;
  final String review;
  final int star;

  Review({
    required this.userName,
    required this.time,
    required this.imgUserName,
    required this.review,
    required this.star,
  });

  static fromJson(reviewData) {}
}

List<Review> reviews = [
  Review(
    userName: "Anna Rose",
    time: "2 hours ago",
    imgUserName: 'assets/images/avt_woman.png',
    review:
        "We had a chance to try some of the food from the restaurant prepared for the food festival, and the chicken croquettes were simply amazing!",
    star: 4,
  ),
  Review(
    userName: "Robert Brown",
    time: "4 hours ago", // Sử dụng số nguyên thay vì chuỗi
    imgUserName: 'assets/images/avt_men.png',
    review:
        "Amazing meat, lamb is a dream. Top service, nice atmosphere. Very recommended. Wine at least must be improved.",
    star: 5, // Sử dụng số nguyên thay vì chuỗi
  ),
  Review(
    userName: "Mike Jhone",
    time: "2 day agos", // Sử dụng số nguyên thay vì chuỗi
    imgUserName: 'assets/images/avt_men.png',
    review:
        "We had a wonderful dinner last night. The food and staff were terrific. Often when we go to restaurants, it is hard to find a menu that works well for both of us. Random makes that a non-issue. My companion was not as hungry as I was. She asked for two appetizers, while I wanted an appetizer and a main. She only wanted an appetizer portion.",
    star: 4, // Sử dụng số nguyên thay vì chuỗi
  ),
  Review(
    userName: "Anna Rose",
    time: "2 hours ago",
    imgUserName: 'assets/images/avt_woman.png',
    review:
        "We had a chance to try some of the food from the restaurant prepared for the food festival, and the chicken croquettes were simply amazing!",
    star: 4,
  ),
];
