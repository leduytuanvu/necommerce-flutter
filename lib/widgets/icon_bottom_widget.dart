import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:necommerce/providers/bottom_bar_provider.dart';
import 'package:provider/provider.dart';

class IconBottomWidget extends StatefulWidget {
  final int index;
  final String image;
  final String lable;
  const IconBottomWidget({
    super.key,
    required this.index,
    required this.image,
    required this.lable,
  });

  @override
  State<IconBottomWidget> createState() => _IconBottomWidgetState();
}

class _IconBottomWidgetState extends State<IconBottomWidget> {
  @override
  void initState() {
    super.initState();
    final bottomBarProvider = Provider.of<BottomBarProvider>(
      context,
      listen: false,
    );
    bottomBarProvider.getIndex;
  }

  @override
  Widget build(BuildContext context) {
    final bottomBarProvider = Provider.of<BottomBarProvider>(context);
    return GestureDetector(
      onTap: () {
        if (bottomBarProvider.getIndex != widget.index) {
          bottomBarProvider.setIndex = widget.index;
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.0,
            width: 20.0,
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/${widget.image}',
                color: bottomBarProvider.getIndex == widget.index
                    ? Colors.black
                    : Colors.grey.shade500,
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            widget.lable,
            style: TextStyle(
              fontSize: 10.0,
              color: bottomBarProvider.getIndex == widget.index
                  ? Colors.black
                  : Colors.grey.shade500,
              fontFamily: 'Source San',
            ),
          ),
        ],
      ),
    );
  }
}
