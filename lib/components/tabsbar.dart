import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:renta/widgets/book_car.dart';
import 'package:renta/widgets/car_widget.dart';
import 'package:renta/widgets/constants.dart';
import 'package:renta/widgets/data.dart';

class TabsBar extends StatefulWidget {
  TabsBar({key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<TabsBar>
    // ignore: non_constant_identifier_names
    with
        SingleTickerProviderStateMixin {
  List<NavigationItem> navigationItems = getNavigationItemList();
  late NavigationItem selectedItem;

  List<Car> cars = getCarList();

  @override
  void asyncinitState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                backgroundColor: const Color(0xFF1B6A65),
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle:
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.directions_car),
                    text: "Sedan",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_car),
                    text: "Hatchback",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_car),
                    text: "SUV",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_car),
                    text: "Luxury",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 250,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: buildDeals(),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 250,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: buildDeals(),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 250,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: buildDeals(),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 250,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: buildDeals(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildDeals() {
    List<Widget> list = [];
    for (var i = 0; i < cars.length; i++) {
      list.add(GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookCar(car: cars[i])),
            );
          },
          child: buildCar(cars[i], i)));
    }
    return list;
  }

  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        width: 50,
        child: Stack(
          children: <Widget>[
            selectedItem == item
                ? Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColorShadow,
                      ),
                    ),
                  )
                : Container(),
            Center(
              child: Icon(
                item.iconData,
                color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
                size: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
