import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';

class PropertySearchResultPage extends StatelessWidget {
  const PropertySearchResultPage({Key? key}) : super(key: key);
  static String propertyResult = '/property-search-result';
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> result = [
      {
        'property_desc': 'A 3 bedroom Flat',
        'property_city': 'Lagos',
        'price': 3000,
        'posted_by': 'ResPro Company Limited',
        'available_for': 'Rent'
      },
      {
        'property_desc': 'A 3 bedroom Flat',
        'property_city': 'Lagos',
        'price': 3000,
        'posted_by': 'ResPro Company Limited',
        'available_for': 'Rent'
      },
      {
        'property_image': 'https://jjfjfjfjfjfj.com',
        'property_desc': 'A 3 bedroom Flat',
        'property_city': 'Lagos',
        'price': 3000,
        'posted_by': 'ResPro Company Limited',
        'available_for': 'Rent'
      }
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Available Properties',
        ),
        backgroundColor: kPrimaryBodyColor,
      ),
      body: Column(
        children: const [
          // ...result.map((e) => e.l),
        ],
      ),
    );
  }
}
