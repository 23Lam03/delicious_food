import 'package:delicious_food/pages/config/const.dart';
import 'package:delicious_food/pages/home/widget/category_page.dart';
import 'package:delicious_food/pages/models/category_models.dart';
import 'package:delicious_food/prociders/category_provider.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryProvider().readJson();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CategoryProvider().readJson(),
        builder: (BuildContext content, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          List<Category> categoryItem = snapshot.hasData ? snapshot.data : [];
          return snapshot.hasData
              ? GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: categoryItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, CategoryPage.routeName,
                            arguments: {
                              "title": categoryItem[index].name,
                              "categoryId": categoryItem[index].id,
                            });
                      },
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage(categoryItem[index].image),
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  categoryItem[index].name.toString(),
                                  style: styleTitleItem,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text('Not Data'),
                );
        });
  }
}
