import 'package:flutter/material.dart';
import 'package:resmart/components/product_list.dart';

class JobList extends StatelessWidget {
  const JobList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String e =
        'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80';
    return ProductList(
      productImagee: e,
      productLocation: "Lagos",
      productPrice: "100000",
      productTitle: "Mercedez Benz LV 350",
      onTapCard: () {
        debugPrint("proceed to product details page");
      },
      onCall: () {
        debugPrint("Oh let make a call");
      },
      onChat: () {
        debugPrint("Send me a message");
      },
    );
  }
}
