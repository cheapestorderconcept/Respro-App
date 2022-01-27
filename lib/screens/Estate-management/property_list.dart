import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:resmart/components/product_list.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/model/estate_model.dart';
import 'package:resmart/model/user_model.dart';
import 'package:resmart/utils/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyListPage extends StatefulWidget {
  const PropertyListPage({Key? key}) : super(key: key);

  @override
  State<PropertyListPage> createState() => _PropertyListPageState();
}

class _PropertyListPageState extends State<PropertyListPage> {
  final ApiService apiService = ApiService();
  EstateModel? estateModel;
  List<EstateModel> estateList = [];
  Future<dynamic> getEstates() async {
    var response = await apiService.getAllEstates();
    //print('data: ${response.data['data']["activeEstate"]}');

    return response.data;
  }

  bool isLoading = false;
  @override
  void initState() {
    getEstates().then((value) {
      var data = value['data']["activeEstate"];
      for (var item in data) {
        setState(() {
          estateList.add(EstateModel.fromData(item));
          isLoading = true;
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (estateList == []) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: kPrimaryBodyColor,
          ),
        ),
      );
    } else {
      return !isLoading ? const Center(
          child: CircularProgressIndicator(
            color:  Colors.amber,
          ),
        ) : ListView.builder(
        itemCount: estateList.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductList(
            productImagee: estateList[index].estateImage.first,
            onTapCard: () {},
            productLocation: estateList[index].estateLocation,
            productPrice: estateList[index].estatePrice,
            productTitle: estateList[index].estateName,
            onCall: () {},
            onChat: () {},
          );
        },
      );
    }
  }
}
