import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/screens/Estate-management/post_property.dart';
import 'package:resmart/screens/Estate-management/property_list.dart';
import 'package:resmart/screens/Job/job_list.dart';
import 'package:resmart/screens/Job/post_job.dart';

class SellPage extends StatelessWidget {
  const SellPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Text(
              'Post New Ads',
              style: kHomeAppBarTextStyle,
            ),
            Text(
              'Ads',
              style: kHomeAppBarTextStyle,
            ),
          ],
        ),
        backgroundColor: kAppBarColor,
      ),
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const TabBar(indicatorColor: Colors.black, tabs: [
                Tab(
                  icon: Text("Sell Property", style: kHomeAppBarTextStyle),
                ),
                Tab(
                  icon: Text("Hire Someone", style: kHomeAppBarTextStyle),
                ),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const TabBarView(children: [
                  PostPropertyPage(),
                  JobPostingPage(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
