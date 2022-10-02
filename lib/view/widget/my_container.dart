import 'package:flutter/cupertino.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key,required this.height,required this.width,this.color,this.radius,required this.child}) : super(key: key);
 final double width;
 final double height;
 final double? radius;
 final Color? color;
 final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius??0),color: color),
      child: child,
    );
  }
}