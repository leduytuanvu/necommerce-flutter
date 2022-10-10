import 'package:flutter/material.dart';
import 'package:necommerce/widgets/product/product_widget.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  List<String> myProducts = [
    'This is a product',
    'This is not a product',
    'Playstation 5',
    'Xbox Series X',
    'Plenty of other products',
    'But this is not one of them',
    'Maybe this is a product',
    'Really not sure',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.8,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemCount: myProducts.length,
        itemBuilder: (BuildContext ctx, index) {
          return const ProductWidget();
        },
      ),
    );
  }
}
