import 'package:flutter/material.dart';
import 'package:resmart/screens/Estate-management/property_search.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
                context, PropertiesSearchPage.propertySearchRoute);
          },
          child: Row(
            children: const <Widget>[
              Icon(Icons.house),
              SizedBox(
                width: 20,
              ),
              Text('Property Search')
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: const <Widget>[
            Icon(Icons.house),
            SizedBox(
              width: 20,
            ),
            Text('Hire a Worker'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: const <Widget>[
            Icon(Icons.house),
            SizedBox(
              width: 20,
            ),
            Text('Got Hired'),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: const <Widget>[
            Icon(Icons.house),
            SizedBox(
              width: 20,
            ),
            Text('Estate Agent')
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: const <Widget>[
            Icon(Icons.house),
            SizedBox(
              width: 20,
            ),
            Text('Developers')
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: const <Widget>[
            Icon(Icons.house),
            SizedBox(
              width: 20,
            ),
            Text('Sign In') //Should be signout if user is not logged In
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: const <Widget>[
            Icon(Icons.house),
            SizedBox(
              width: 20,
            ),
            Text('Register') //visible only if user is not logged In
          ],
        ),
      ],
    );
  }
}
