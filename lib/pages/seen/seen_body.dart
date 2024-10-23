import 'package:delicious_food/pages/config/const.dart';
import 'package:flutter/material.dart';

class SeenBody extends StatelessWidget {
  const SeenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey<int>(index),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: double.infinity,
              height: 140,
              child: GridTile(
                footer: const GridTileBar(
                  title: Text(
                    'Swipe to delete.',
                    style: styleTitleItem,
                  ),
                  trailing: Icon(
                    Icons.swipe,
                    size: sizeIconButtonTitle,
                    color: dColorIconButtonInactive,
                  ),
                  backgroundColor: Colors.white70,
                ),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://plus.unsplash.com/premium_photo-1673108852141-e8c3c22a4a22?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
