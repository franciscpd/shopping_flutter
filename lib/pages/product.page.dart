import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class ProductPage extends StatelessWidget {
  final String image;
  final String title;
  final String brand;
  final double price;

  ProductPage({
    @required this.image,
    @required this.title,
    @required this.brand,
    @required this.price,
  });

  @override
  Widget build(BuildContext context) {
    MoneyFormatterOutput fmf = new FlutterMoneyFormatter(
        amount: price,
        settings: MoneyFormatterSettings(
          symbol: '\$ ',
          thousandSeparator: ',',
          decimalSeparator: '.',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 2,
        )).output;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white.withOpacity(0),
              elevation: 0.0,
              expandedHeight: 500.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Hero(
                  tag: image,
                  child: Image.asset(
                    image,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('by $brand'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                  'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.'),
            ),
          ],
        ),
      ),
    );
  }
}
