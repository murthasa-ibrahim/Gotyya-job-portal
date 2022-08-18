import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  const MyText({Key? key,required this.data,this.color,this.size,this.fontWeight}) : super(key: key);
  final String data;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(data,style: GoogleFonts.balooTamma2(fontSize: size,color: color,fontWeight:fontWeight),);
  }
}