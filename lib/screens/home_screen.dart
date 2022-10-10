import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:necommerce/providers/category_provider.dart';
import 'package:necommerce/widgets/carousel_widget.dart';
import 'package:necommerce/widgets/product/products_widget.dart';
import 'package:necommerce/widgets/search_widget.dart';
import 'package:necommerce/widgets/tab_bar_custom_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    final categoryProvider = Provider.of<CategoryProvider>(
      context,
      listen: false,
    );
    categoryProvider.getIndex;
  }

  List<String> list = [
    'Des price',
    'Asc price',
    'Popular',
    'Newest',
    'Best seller',
    'Rating',
    'Discount',
  ];

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return ListView(
      children: [
        const SearchWidget(),
        const CaroselWidget(),
        const TabBarCustomWidget(),
        Container(
          height: 50,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    height: 50,
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(child: Text('${list[index]}')),
                    ),
                  );
                }
                return Container(
                  height: 50,
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(child: Text('${list[index]}')),
                  ),
                );
              },
              itemCount: list.length),
        ),
        const ProductsWidget(),
      ],
    );
  }
}
