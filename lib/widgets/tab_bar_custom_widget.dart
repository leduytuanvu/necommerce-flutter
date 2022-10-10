import 'package:flutter/material.dart';
import 'package:necommerce/providers/category_provider.dart';
import 'package:provider/provider.dart';

class TabBarCustomWidget extends StatefulWidget {
  const TabBarCustomWidget({super.key});

  @override
  State<TabBarCustomWidget> createState() => _TabBarCustomWidgetState();
}

class _TabBarCustomWidgetState extends State<TabBarCustomWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<String> list = [
    'All',
    'Men',
    'Women Accessories',
    'Kids',
    'Products',
    'Accessories',
    'Bags Accessories',
    'Jewellery',
    'Other',
  ];

  Widget getWidget(CategoryProvider categoryProvider) {
    List<Widget> listW = [];
    for (int i = 0; i < list.length; i++) {
      if (i == 0) {
        listW.add(const SizedBox(width: 15));
      }
      listW.add(
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              categoryProvider.setIndex = i;
              _controller.forward().then((value) => _controller.reverse());
              // _controller.forward();
            },
            child: ScaleTransition(
              scale: categoryProvider.getIndex == i
                  ? _controller
                  : _controller.drive(Tween(begin: 1.0, end: 1.0)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                constraints: const BoxConstraints(
                  minWidth: 60,
                ),
                height: 30,
                decoration: BoxDecoration(
                  color: categoryProvider.getIndex == i
                      // ? Colors.pink.shade200
                      ? Colors.white
                      : Colors.white38,
                  borderRadius: BorderRadius.circular(100.0),
                  boxShadow: categoryProvider.getIndex == i
                      ? [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.60),
                            spreadRadius: 1.0,
                            blurRadius: 1.0,
                            offset: const Offset(1.0, 1.0),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.30),
                            spreadRadius: 0.2,
                          ),
                        ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      list[i],
                      style: const TextStyle(
                        fontFamily: 'Source Sans',
                        letterSpacing: 0.8,
                        wordSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      if (i != list.length - 1) {
        listW.add(const SizedBox(width: 5));
      } else {
        listW.add(const SizedBox(width: 15));
      }
    }
    return SizedBox(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...listW,
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final categoryProvider = Provider.of<CategoryProvider>(
      context,
      listen: false,
    );
    categoryProvider.getIndex;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: 1,
      lowerBound: 1,
      upperBound: 1.01,
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return getWidget(categoryProvider);
  }
}
