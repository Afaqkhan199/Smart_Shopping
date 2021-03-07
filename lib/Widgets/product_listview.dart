import 'package:flutter/material.dart';
import 'package:fyp_smart_shopping/Pages/product.dart';

class ProductsListView extends StatefulWidget {
  @override
  _ProductsListViewState createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  List<Product> products = [
    Product('Led', 'ABC', '1500', '15'),
    Product('RTX1080', '4', '2500', '20'),
    Product('Fast', 'MI', '3500', '25'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ShowProduct(
            // products: products[index],
            );
      },
      itemCount: products.length,
    );
  }
}
