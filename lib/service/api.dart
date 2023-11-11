// ignore_for_file: use_rethrow_when_possible, avoid_print, constant_identifier_names

import 'dart:convert';

import 'package:food/model/product_model.dart';
import 'package:http/http.dart' as http;

class API {
  static const BASE_URL = "http://localhost:3002";
  static final cookieJar = Map<String, String>();

  static Future<String> getHelloWorld() async {
    try {
      final response = await http.get(Uri.parse('$BASE_URL/'));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
      throw error; // Rethrow lỗi để có thể xử lý nó ở nơi gọi hàm fetchData
    }
  }

  static Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('$BASE_URL/products'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Chuyển đổi danh sách sản phẩm từ Map sang List<Product>
        final List<dynamic> productsData = data['products'];
        final List<Product> products = productsData
            .map((productData) => Product.fromJson(productData))
            .toList();

        return products;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }

  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$BASE_URL/login'),
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Đăng nhập thành công, lưu trữ cookie
        cookieJar.addAll(response.headers);

        // Phản hồi từ API chứa thông tin người dùng
        final Map<String, dynamic> userData = json.decode(response.body);
        return userData;
      } else {
        // Đăng nhập thất bại, xử lý lỗi hoặc thông báo
        throw Exception('Failed to login');
      }
    } catch (error) {
      print('Error: $error');
      throw error;
    }
  }
}
