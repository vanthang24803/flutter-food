import 'package:flutter/material.dart';
import 'package:food/search.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Ảnh nền full màn hình
          Image.asset(
            'assets/images/thumnail_login.jpg', // Thay đổi đường dẫn tới ảnh của bạn
            fit: BoxFit.cover,
          ),
          // Nội dung trung tâm
          Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Đẩy nội dung lên trên một chút
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset("assets/images/logo.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    obscureText: true, // Ẩn mật khẩu
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const Search(), // Thay thế `SearchScreen` bằng tên màn hình bạn muốn chuyển đến
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFDB166E)), // Đặt màu nền theo mã màu HEX
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(380, 51)), // Đặt kích thước nút
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white, // Đặt màu chữ màu trắng
                      fontSize: 16, // Tùy chỉnh kích thước chữ theo nhu cầu
                    ),
                  ),
                ),
                const SizedBox(
                    height:
                        16), // Khoảng cách giữa nút đăng nhập và dòng văn bản
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(
                      width:
                          8), // Khoảng cách giữa "Don't have an account" và "Sign in"
                  Text(
                    "Sign in",
                    style: TextStyle(fontSize: 16, color: Color(0xFFDB166E)),
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
