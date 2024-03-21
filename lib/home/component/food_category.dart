import 'package:flutter/material.dart';

import '../../core/color_manger.dart';
class FoodCategory extends StatelessWidget {
  const FoodCategory({
    super.key,
    required this.myWidth,
    required this.image,
    required this.title,
    required this.index,
    required this.currentIndex,
  });

  final double myWidth;
  final String image;
  final String title;
  final String index;
  final String currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          width: myWidth * .145,
          decoration: BoxDecoration(
              color: index == currentIndex
                  ? ColorManager.primary
                  : ColorManager.lightGrey,
              borderRadius: BorderRadius.circular(12)),
          child: Image.asset(
            image,
            color:
            index == currentIndex ? ColorManager.white : ColorManager.grey,
          ),
        ),
        Text(
          title,
          style: index == currentIndex
              ? TextStyle(
              color: ColorManager.black, fontWeight: FontWeight.bold)
              : TextStyle(color: ColorManager.grey),
        )
      ],
    );
  }
}
