import 'package:delicious_food/pages/config/const.dart';
import 'package:delicious_food/pages/home/widget/category_body.dart';
import 'package:delicious_food/pages/home/widget/product_page.dart';
import 'package:delicious_food/pages/models/product_models.dart';
import 'package:delicious_food/prociders/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/category';
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map?;

    if (data == null || !data.containsKey('categoryId')) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: dColorMain,
          title: const Text('Category'),
        ),
        body: const Center(
          child: Text('Invalid category data!'),
        ),
      );
    }

    final products = Provider.of<ProductProvider>(context, listen: false)
        .getItemsWithCategoryId(data['categoryId']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dColorMain,
        title: Text(
          data['title'],
        ),
      ),
      body: products.isEmpty
          ? const Center(
              child: Text('No products available in this category!'),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(15),
              itemCount: products.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 20);
              },
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductPage.routeName,
                      arguments: {"id": products[index].id},
                    );
                  },
                  child: ChangeNotifierProvider<Product>.value(
                    value: products[index],
                    child: const CategoryBody(),
                  ),
                );
              },
            ),
    );
  }
}
