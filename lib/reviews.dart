// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});
  
  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDB166E),
        toolbarHeight: 60, // Đặt chiều cao cho AppBar
        title: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/vectors/arrow-left.svg',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
              const Text(
                "REVIEWS",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/vectors/search.svg',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap:
                  true, // Để tránh lỗi 'Vertical viewport was given unbounded height'
              itemCount: reviews.length, // Số lượng hàng trong danh sách
              itemBuilder: (BuildContext context, int index) {
                // Trả về một hàng cụ thể dựa trên dữ liệu ở vị trí index
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
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
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
                              width:
                                  280, // Đặt chiều rộng cố định của Container
                              child: Text(
                                data.review,
                                maxLines: 20, // Số dòng tối đa
                                overflow: TextOverflow
                                    .ellipsis, // Hiển thị dấu chấm 3 chấm (...) khi cắt ngắn
                                softWrap: true, // Cho phép tự động xuống dòng
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
