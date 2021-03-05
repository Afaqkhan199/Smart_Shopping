import 'package:flutter/material.dart';

class Product {
  String _name, _description, _price, _quantity;
  Product(this._name, this._description, this._price, this._quantity);
}

class ShowProduct extends StatelessWidget {
  ShowProduct({this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Image(
            image: AssetImage('images/Logo.png'),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 90, 10),
          child: Column(
            children: <Widget>[
              Text(
                product._name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '   ' + product._price,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
