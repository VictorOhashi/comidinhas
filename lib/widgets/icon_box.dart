import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final Color? color;

  const IconBox({Key? key, required this.onTap, required this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Color(0xCCFFFFFF),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
