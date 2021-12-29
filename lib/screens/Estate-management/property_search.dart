import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/screens/Estate-management/property_search_result.dart';
import 'package:resmart/widgets/forms.dart';

String? dropdownValue = 'Flat';
String? usage = 'Rent';
String? budget;
String? city = 'Lagos';

class PropertiesSearchPage extends StatelessWidget {
  PropertiesSearchPage({Key? key}) : super(key: key);
  static String propertySearchRoute = '/property-search';
  final ValueNotifier<String?> v = ValueNotifier(dropdownValue);
  final ValueNotifier<String?> uses = ValueNotifier(usage);
  @override
  Widget build(BuildContext context) {
    String appBarTitle = 'Search Property';
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          appBarTitle,
        ),
        backgroundColor: kPrimaryBodyColor,
      ),
      body: ListView(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 18.0, left: 10.0, bottom: 10.0),
              child: MyFormTitle(label: 'Location'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: MyFormField(
                formHeight: 80,
                borderSide: BorderSide.none,
                filled: true,
                hintText: 'Please enter city',
                fillColor: Colors.white,
                onChanged: (val) {
                  city = val;
                },
                validator: (val) {},
                formWidth: 350,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: MyFormTitle(label: 'Property types'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25, top: 0, bottom: 10.0),
              child: ValueListenableBuilder(
                valueListenable: v,
                builder: (BuildContext context, hasError, Widget? child) {
                  return CustomDropDown(
                    formWidth: 350,
                    color: Colors.white,
                    dropdownValue: v.value,
                    onChanged: (val) {
                      v.value = val;
                    },
                    items: const ['Flat', 'Land', 'Shop', 'All'],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: MyFormTitle(label: 'What do you need it for?'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25, top: 0),
              child: ValueListenableBuilder(
                valueListenable: uses,
                builder: (BuildContext context, error, Widget? child) {
                  return CustomDropDown(
                    formWidth: 350,
                    color: Colors.white,
                    dropdownValue: uses.value,
                    onChanged: (val) {
                      uses.value = val;
                    },
                    items: const ['Rent', 'Buy', 'Lease', 'All'],
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 18.0, left: 10.0, bottom: 10.0),
              child:
                  MyFormTitle(label: 'What is your annual estimated Budget?'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: MyFormField(
                formHeight: 80,
                borderSide: BorderSide.none,
                filled: true,
                hintText: 'Please enter your estimated budget',
                fillColor: Colors.white,
                onChanged: (estimatedBudget) {
                  budget = estimatedBudget;
                },
                validator: (val) {},
                formWidth: 350,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyFormButton(
                label: 'Search',
                onPressed: () {
                  Navigator.pushNamed(
                      context, PropertySearchResultPage.propertyResult);
                },
                height: 50,
                width: double.infinity,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
