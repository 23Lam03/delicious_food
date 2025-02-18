import 'dart:convert';

import 'package:delicious_food/pages/models/category_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _items = [];

  List<Category> get items => [..._items];

  Future<List<Category>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/category.json');

    final dataDecode = await json.decode(response);
    List<Category> data = List<Category>.from(
      dataDecode.map(
        (i) => Category.fromJson(
          jsonEncode(i),
        ),
      ),
    );
    _items = data;
    print(items);
    return data;
  }
}
