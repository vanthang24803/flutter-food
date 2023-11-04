// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: <Widget>[
              Container(
                color: const Color(0xFFDB166E),
                height: 60,
              ),
              Align(
                alignment: Alignment.topCenter, // Để căn giữa theo chiều dọc
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 8.0, right: 8.0, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          'assets/vectors/arrow-left.svg',
                          width: 24,
                          height: 24,
                          color: Colors.white, // Đặt màu trắng cho SVG
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "PAYMENT METHOD",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white, // Đặt màu trắng cho văn bản
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/vectors/search.svg',
                          width: 24,
                          height: 24,
                          color: Colors.white, // Đặt màu trắng cho SVG
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                      ),
                      child: SvgPicture.asset(
                        'assets/vectors/card.svg',
                        width: 22,
                        height: 22,
                        color: const Color(0xFFDB166E), // Đặt màu trắng cho SVG
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Add to Card",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ), // Màu chữ gợi ý
                          filled: true, // Bật nền màu
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      'assets/vectors/chevron-right.svg',
                      width: 24,
                      height: 24,
                      color: Colors.grey, // Đặt màu trắng cho SVG
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 25, left: 12, right: 12, bottom: 13),
                child: Text(
                  "BANK ACCOUNTS",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Frankin Campbell  - ***6383",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ), // Màu chữ gợi ý
                          filled: true, // Bật nền màu
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      'assets/vectors/chevron-right.svg',
                      width: 24,
                      height: 24,
                      color: Colors.grey, // Đặt màu trắng cho SVG
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 25, left: 12, right: 12, bottom: 13),
                child: Text(
                  "CREDIT CARDS",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "**** **** **** 2779",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ), // Màu chữ gợi ý
                          filled: true, // Bật nền màu
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      "assets/images/visa.png",
                      width: 60,
                      height: 60,
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "adaff_hs@gmail.com",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ), // Màu chữ gợi ý
                        filled: true, // Bật nền màu
                        fillColor: Colors.white,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/images/paypal.png",
                    width: 70,
                    height: 70,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "**** **** **** 1334",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ), // Màu chữ gợi ý
                        filled: true, // Bật nền màu
                        fillColor: Colors.white,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/images/mastercard.png",
                    width: 60,
                    height: 60,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Image.asset(
              "assets/images/payment_footer.png",
              height: double
                  .infinity, // Sử dụng double.infinity để chiếm hết phần còn lại của màn hình theo chiều dọc
              width: double
                  .infinity, // Sử dụng double.infinity để chiếm hết phần còn lại của màn hình theo chiều ngang
              fit: BoxFit
                  .cover, // Đảm bảo hình ảnh được căn chỉnh và vừa vặn với không gian được cung cấp
            ),
          )
        ],
      ),
    );
  }
}
