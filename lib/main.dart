import 'package:delicious_food/pages/home/widget/category_page.dart';
import 'package:delicious_food/pages/home/widget/product_page.dart';
import 'package:delicious_food/pages/index.dart';
import 'package:delicious_food/prociders/category_provider.dart';
import 'package:delicious_food/prociders/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ChangeNotifierProvider(create: (_) => ProductProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        MyApp.routeName: ((context) => const MyApp()),
        CategoryPage.routeName: ((context) => const CategoryPage()),
        ProductPage.routeName: ((context) => const ProductPage()),
      },
    ),
  ));
}
