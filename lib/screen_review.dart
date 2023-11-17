// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenReview extends StatefulWidget {
  const ScreenReview({Key? key});

  @override
  State<ScreenReview> createState() => _ScreenReviewState();
}

class _ScreenReviewState extends State<ScreenReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFDB166E),
        toolbarHeight: 60, // Set the height for the AppBar
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
      body: SingleChildScrollView(
        child: Padding(
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.userName,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
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
      ),
    );
  }
}

