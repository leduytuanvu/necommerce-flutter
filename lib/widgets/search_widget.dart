import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.60),
              spreadRadius: 1.0,
              blurRadius: 1.0,
              offset: const Offset(1.0, 1.0),
            ),
          ],
        ),
        height: 45.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 15),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  ' Search products',
                  style: TextStyle(
                    wordSpacing: 3,
                    letterSpacing: 0.5,
                    fontFamily: 'Source San',
                    fontSize: 18,
                    color: Colors.black45,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/search_solid.svg',
                  color: Colors.black38,
                  height: 18,
                  width: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
