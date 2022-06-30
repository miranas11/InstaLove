import 'package:flutter/material.dart';
import 'package:dating/components/constants.dart';

double height = 0;
double width = 0;

class SignInButton extends StatelessWidget {
  const SignInButton({
    this.text = '',
    this.color = kPurpleColor,
    this.heightPercent = 0.085,
    this.marginWidthPercent = widthgap,
    this.icon,
    this.colorIcon = Colors.white,
    this.colorText = Colors.white,
    this.onTap,
    this.noIcon = false,
    Key? key,
  }) : super(key: key);
  final String text;
  final Color color;
  final double heightPercent;
  final double marginWidthPercent;
  final IconData? icon;
  final Color colorIcon;
  final Color colorText;
  final VoidCallback? onTap;
  final bool noIcon;

  @override
  Widget build(BuildContext context) {
    height = getHeight(context);
    width = getWidth(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: marginWidthPercent * width),
        height: heightPercent * height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: colorIcon,
            ),
            !noIcon ? SizedBox(width: 0.03 * width) : const SizedBox.shrink(),
            Text(
              text,
              style: TextStyle(
                  color: colorText,
                  fontWeight: FontWeight.w500,
                  fontSize: 0.02 * height),
            ),
          ],
        ),
      ),
    );
  }
}
