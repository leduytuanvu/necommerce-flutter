import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 140,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/demo.svg',
                      width: 140,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Prrety girl number one - \$100',
                        style: TextStyle(
                          fontFamily: 'Source Sans',
                          fontSize: 13,
                          color: Colors.black87,
                          letterSpacing: 0.2,
                          wordSpacing: 0.6,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Prrety girl number one Prrety girl number one',
                        style: TextStyle(
                          fontFamily: 'Source Sans',
                          fontSize: 11,
                          color: Colors.black87,
                          letterSpacing: 0.2,
                          wordSpacing: 0.6,
                        ),
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 8,
            child: Container(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                'assets/icons/heart_solid.svg',
                fit: BoxFit.fill,
                color: Colors.red,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 10,
            child: Container(
              width: 18,
              height: 18,
              child: SvgPicture.asset(
                'assets/icons/cart_shopping_solid.svg',
                fit: BoxFit.fill,
                color: Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
