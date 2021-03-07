import 'package:flutter/material.dart';

class showProduct {
  String _name, _price;
  showProduct(this._name, this._price);

  String getName() {
    return _name;
  }

  String getPrice() {
    return _price;
  }
}

class ShowProduct extends StatelessWidget {
  ShowProduct({this.product});
  final showProduct product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Image(
            //product.getImage(),
            image: AssetImage('images/card.JPG'),
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                //product.getName(),
                'Graphic Card',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '   ' + product.getPrice(),
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
