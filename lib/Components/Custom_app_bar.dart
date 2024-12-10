import 'package:flutter/material.dart';
import 'package:talasuf_car_care/Components/Utilis.dart';

class RoundedAppBar extends StatelessWidget  {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;

  const RoundedAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.borderRadius = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(borderRadius),
      ),
      child: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          title,
          style: TextStyle(color: textColor),
        ),
centerTitle: true,
        elevation: 4,
      ),
    );
  }


}
