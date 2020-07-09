import 'package:fooddeliveryapp/Components/Categories/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/Models/category.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<Category>>(context) ?? [];

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryCard(category: categories[index]);
      },
    );
  }
}
