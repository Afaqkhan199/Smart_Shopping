import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/show_product.dart';

class ProductsListView extends StatefulWidget {
  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  List<showProduct> products = [
    showProduct('Led', '20000'),
    showProduct('Charger', '500'),
    showProduct('Graphic card', '50000'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ShowProduct(
          product: products[index],
        );
      },
      itemCount: products.length,
    );
  }
}
