import 'package:flutter/material.dart';
import 'package:food/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Login()),
          ),
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: const ShapeDecoration(
                  color: Color(0xFFDB166E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                    ),
                  ),
                ),
                child: Center(
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
            ),
            Expanded(
              child: Image.asset(
                "assets/images/shipper.png",
                width: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
