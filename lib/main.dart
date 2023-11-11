import 'package:flutter/material.dart';
import 'package:food/contact.dart';
import 'package:food/screen_appbar/appbarScreen.dart';
import 'package:food/screen_appbar/pageFavoriesInItem.dart';
// import 'package:food/label_search.dart';
import 'package:food/test.dart';
// import 'package:food/profile.dart';
// import 'package:food/contact.dart';
// import 'package:food/book_table.dart';
// import 'package:food/notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: TESTVIEW(),
        )
      ),
    );
  }
}
