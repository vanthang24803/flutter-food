import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppbarScreen extends StatefulWidget {
  const AppbarScreen({super.key});

  @override
  State<AppbarScreen> createState() => _AppbarScreenState();
}

class _AppbarScreenState extends State<AppbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 170,
            color: const Color(0xFFAC1458),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 10, right: 24, left: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Icon(Icons.filter_alt_rounded,
                              color: Color(0xFFFFFFFF)),
                          Text(
                            "Filter",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(
                          Icons.grid_view,
                          color: Color(0xFFFFFFFF),
                        ),
                        Icon(
                          Icons.comment_bank,
                          color: Color(0xFFFFFFFF),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFDB166E),
              borderRadius: BorderRadius.circular(16),
            ),
            height: 130,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Nearby",
                            style: TextStyle(color: Color(0xFFFFFFFF)),
                          ))),
                  Expanded(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Popular",
                            style: TextStyle(color: Color(0xFFFFFFFF)),
                          ))),
                  Expanded(
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Top Review",
                            style: TextStyle(color: Color(0xFFFFFFFF)),
                          ))),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Recommen",
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: Stack(
              children: [
                Container(
                  height: 48,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:
                        const Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search for address, food...",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ), // Màu chữ gợi ý
                      filled: true, // Bật nền màu
                      fillColor: Colors.white, // Màu nền
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey, // Màu icon
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          // Xử lý khi nút Submit được nhấn
                        },
                        icon: SvgPicture.asset(
                          'assets/vectors/location.svg', // Đường dẫn tới hình ảnh SVG
                          width: 24, // Kích thước của hình ảnh
                          height: 24,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .white), // Màu viền khi ô văn bản không được tập trung
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .white), // Màu viền khi ô văn bản được tập trung
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.grey, // Màu chữ trong ô văn bản
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 20,
                  child: Container(
                    child: const Text(
                      "Italy",
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
