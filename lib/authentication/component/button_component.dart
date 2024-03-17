import 'package:flutter/material.dart';

import '../../core/color_manger.dart';

class ButtonComponent extends StatelessWidget {
   ButtonComponent({
    super.key,
    required this.title,
    required this.function,
  });

  final String title;
  void Function()? function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorManager.primary,
        ),
        height: 57,
        width: MediaQuery.of(context).size.width,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
