import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({Key? key, required this.text, this.color = const Color.fromRGBO(117, 117, 117, 1), this.onTap, this.suffixWidget, required this.prefixWidget}) : super(key: key);

  final String text;

  final Color color;
  final Function()? onTap;
  //for now we are using icondata
  final Widget? suffixWidget;
  final IconData prefixWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(top: 2, bottom: 2),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 13,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: suffixWidget != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(prefixWidget, size: 28, color: color),
                  ),
                  Text(
                    text,
                    style: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              suffixWidget ?? SizedBox(),
            ],
          )),
    );
  }
}
