import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Cart.dart';
import 'Home.dart';
import 'Search.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _index = 0;

  bool isSearchActive = false;

  final List<Widget> screens = [
    const Home(),
    const Search(),
    const Cart(),
  ];

  final Color primaryColor = Color.fromARGB(255, 162, 226, 162);
  final Color accentColor = const Color(0xFFFFC107);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 196, 236, 196),
        elevation: 0,
        toolbarHeight: 100,
        title: Image.asset(
          "assets/logo.png",
          height: 60,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 1, 29, 1),
            size: 30,
          ),
        ),
      ),
      body: screens[_index],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: primaryColor,
        height: 60,
        index: _index,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
