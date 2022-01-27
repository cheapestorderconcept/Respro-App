import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList(
      {Key? key,
      required this.productImagee,
      required this.productTitle,
      this.child,
      required this.onCall,
      required this.onChat,
      required this.productPrice,
      required this.onTapCard,
      required this.productLocation})
      : super(key: key);

  final String productImagee;
  final String productTitle;
  final String productLocation;
  final String productPrice;
  final Widget? child;
  final Function()? onTapCard;
  final Function()? onChat;
  final Function()? onCall;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          child: child,
        ),
        InkWell(
          onTap: onTapCard,
          splashColor: Colors.blue[200],
          child: Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Card(
              elevation: 4.0,
              margin: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 130,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(productImagee)),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                productTitle,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.location_pin),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(productLocation,
                                      style: const TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Text('Price:'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(productPrice,
                                      style: const TextStyle(fontSize: 16)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 5,
                    color: Colors.green,
                    thickness: 1.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: onChat,
                          splashColor: Colors.grey,
                          child: Row(
                            children: const [
                              Icon(Icons.email_outlined),
                              SizedBox(width: 5),
                              Text(
                                "Chat",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 20,
                            child: VerticalDivider(
                              color: Colors.green,
                              thickness: 1.5,
                              width: 30,
                            )),
                        InkWell(
                          onTap: onCall,
                          splashColor: Colors.grey,
                          child: Row(
                            children: const [
                              Icon(Icons.call),
                              SizedBox(width: 5),
                              Text(
                                "Call",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.green,
                    thickness: 1.5,
                    height: 5,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
