import 'package:delicious_food/pages/config/const.dart';
import 'package:delicious_food/pages/favotite/favotite_body.dart';
import 'package:delicious_food/pages/home/home_body.dart';
import 'package:delicious_food/pages/seen/seen_body.dart';
import 'package:delicious_food/prociders/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  static const routeName = '/';
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  late Future _dataFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dataFuture = Provider.of<ProductProvider>(context).readJson();
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeBody(),
    const FavoriteBody(),
    const SeenBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _dataFuture,
        builder: (BuildContext content, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Delicious Food'),
              backgroundColor: dColorMain,
            ),
            body: _widgetOptions[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.timelapse_sharp),
                  label: 'Seen',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: dColorMain,
              iconSize: sizeIconButton,
              unselectedItemColor: dColorIconButtonInactive,
              selectedItemColor: dColorIconButtonActive,
            ),
          );
        });
  }
}
