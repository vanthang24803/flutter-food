import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/listItem.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Ảnh nền full màn hình
          Image.asset(
            'assets/images/thumnail_user.jpg', // Thay đổi đường dẫn tới ảnh của bạn
            fit: BoxFit.cover,
          ),
          // Phần đầu
          Positioned(
            top: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/avt_woman.png', // Thay đổi đường dẫn tới ảnh của bạn
                      width: 100,
                      height: 100,
                    ),
                    const Text("Hi , Rose",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "What can",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                // Dòng chữ "we serve you"
                const Text(
                  "we serve you",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                // Dòng chữ "today?"
                const Text(
                  "today?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Phần giữa
          Positioned(
            top: 350,
            left: 20,
            right: 20,
            child: InkWell(
              onFocusChange: (value) => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ListItem()),
                ),
              },
              child: Column(
                children: [
                  TextFormField(
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
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý sự kiện khi nút được nhấn
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFDB166E)), // Đặt màu nền theo mã màu HEX
                      minimumSize: MaterialStateProperty.all<Size>(
                          const Size(400, 51)), // Đặt kích thước nút
                    ),
                    child: const Text(
                      'SEARCH',
                      style: TextStyle(
                        color: Colors.white, // Đặt màu chữ màu trắng
                        fontSize: 16, // Tùy chỉnh kích thước chữ theo nhu cầu
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
