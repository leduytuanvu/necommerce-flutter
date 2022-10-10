import 'package:flutter/material.dart';
import 'package:necommerce/providers/bottom_bar_provider.dart';
import 'package:necommerce/screens/cart_screen.dart';
import 'package:necommerce/screens/favorite_screen.dart';
import 'package:necommerce/screens/home_screen.dart';
import 'package:necommerce/screens/profile_screen.dart';
import 'package:necommerce/screens/search_screen.dart';
import 'package:necommerce/widgets/icon_bottom_widget.dart';
import 'package:provider/provider.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  @override
  void initState() {
    super.initState();
    final bottomBarProvider = Provider.of<BottomBarProvider>(
      context,
      listen: false,
    );
    bottomBarProvider.getIndex;
  }

  Widget _getScreen(int bottomBarIndex) {
    switch (bottomBarIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const FavoriteScreen();
      case 2:
        return const SearchScreen();
      case 3:
        return const CartScreen();
      default:
        return const ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomBarProvider = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(224, 255, 193, 7),
      body: Stack(
        children: [
          _getScreen(bottomBarProvider.getIndex),
          Positioned(
            left: 8.0,
            right: 8.0,
            bottom: 7.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.40),
                    spreadRadius: 1.0,
                    blurRadius: 1.0,
                    offset: const Offset(1.0, 1.0),
                  ),
                ],
              ),
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  IconBottomWidget(
                    index: 0,
                    image: 'house_solid.svg',
                    lable: 'Home',
                  ),
                  IconBottomWidget(
                    index: 1,
                    image: 'heart_solid.svg',
                    lable: 'Favorite',
                  ),
                  IconBottomWidget(
                    index: 2,
                    image: 'star_solid.svg',
                    lable: 'Rate',
                  ),
                  IconBottomWidget(
                    index: 3,
                    image: 'cart_shopping_solid.svg',
                    lable: 'Cart',
                  ),
                  IconBottomWidget(
                    index: 4,
                    image: 'user_solid.svg',
                    lable: 'User',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
