import 'package:flutter/material.dart';
import 'package:food/all_categories/list_production.dart';
import 'package:food/all_categories/row.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: const Column(
        children: [
          RowItem(),
          ListProduction(),
        ],
      ),
    );
  }
}