import 'package:flutter/material.dart';
import 'package:kappi/src/views/utilies/colors.dart';

class Custombuttonwidget extends StatelessWidget {
  final  Function()? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final bool? isLoading;
  const Custombuttonwidget({super.key, this.onPressed, required this.text, required this.color, required this.textColor, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16)
          )
        ),
        onPressed:onPressed,
      child: isLoading == true ? CircularProgressIndicator(
        color: Appcolors.appColors.shade100,
      ) :Text(text,style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: textColor,
      ))),
    );
  }
}