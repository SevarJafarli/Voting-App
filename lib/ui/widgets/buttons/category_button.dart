import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.text,
    this.color = const Color.fromRGBO(224, 224, 224, 1),
    this.hasBorder = false,
    this.onTap,
  }) : super(key: key);
  final String text;
  final Color color;
  final bool hasBorder;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: hasBorder? Colors.white : color,
          borderRadius: BorderRadius.circular(
            15,
          ),
          border: hasBorder ? Border.all(color: color, width: 2) : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: color == Color.fromRGBO(224, 224, 224, 1) ?  Colors.black : color,
          ),
        ),
      ),
    );
  }
}
