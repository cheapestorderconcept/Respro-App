import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resmart/constants/style.dart';
import 'package:resmart/screens/Auth/login.dart';
import 'package:resmart/screens/Auth/profile.dart';
import 'package:resmart/screens/Auth/signup.dart';
import 'package:resmart/screens/Estate-management/property_list.dart';
import 'package:resmart/screens/Job/job_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:resmart/screens/SellPage/sell.dart';
import 'package:resmart/screens/search/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

int tabIndex = 0;

class _HomePageState extends State<HomePage> {
  static const bottomNavBarPages = <Widget>[
    Home(
      imgList: [
        'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
        'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      ],
    ),
    SearchPage(),
    SellPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            iconSize: 28,
            currentIndex: tabIndex,
            onTap: (i) {
              setState(() {
                tabIndex = i;
              });
            },
            elevation: 4.0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            selectedIconTheme: const IconThemeData(color: kIconColor),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.star), label: "Features"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.saved_search), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Sell"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Account"),
            ]),
        body: bottomNavBarPages.elementAt(tabIndex),
      ),
    );
  }
}

// appBar: AppBar(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, SignupPage.regRoute);
//                 },
//                 child: const Text(
//                   'SIGN UP',
//                   style: kHomeAppBarTextStyle,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, LoginPage.loginRoute);
//                 },
//                 child: const Text(
//                   'LOGIN',
//                   style: kHomeAppBarTextStyle,
//                 ),
//               ),
//             ],
//           ),
//           backgroundColor: kAppBarColor,
//         ),
class Home extends StatefulWidget {
  const Home({
    Key? key,
    required this.imgList,
  }) : super(key: key);

  final List<String> imgList;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;
  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CarouselSlider(
            options: CarouselOptions(autoPlay: true),
            items: widget.imgList.map((e) {
              return CachedNetworkImage(
                imageUrl: e,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                            Colors.red, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            }).toList()),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              debugPrint("Navigate to property list page");
            },
            splashColor: Colors.grey,
            child: Container(
              decoration: const BoxDecoration(
                  color: kPrimaryBodyColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 40,
              child: const Center(
                child: Text(
                  'BUY, SELL AND GOT HIRED ONLINE',
                  textAlign: TextAlign.center,
                  style: kFontSize12WeightBold,
                ),
              ),
            ),
          ),
        ),
        DefaultTabController(
          length: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const TabBar(indicatorColor: Colors.black, tabs: [
                Tab(
                  icon: Text("Buy Properties", style: kHomeAppBarTextStyle),
                ),
                Tab(
                  icon: Text("Get Hired", style: kHomeAppBarTextStyle),
                ),
              ]),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(children: [
                  !isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color:  Colors.amber,
                          ),
                        )
                      : const PropertyListPage(),
                 !isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.amber,
                          ),
                        )
                      : const JobList(),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
