import 'package:flutter/material.dart';
import 'package:dating/components/constants.dart';

double height = 0;
double width = 0;

class InputData extends StatelessWidget {
  const InputData({
    this.text = '',
    this.fieldText = '',
    this.password = false,
    this.iconData,
    required this.controller,
    this.onSubmit,
    this.ontap,
    Key? key,
  }) : super(key: key);
  final String text;
  final String fieldText;
  final bool password;
  final IconData? iconData;
  final TextEditingController? controller;
  final VoidCallback? ontap;
  final Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    height = getHeight(context);
    width = getWidth(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextModi(text: text),
        TextField(
          cursorColor: kPurpleColor,
          controller: controller,
          onTap: ontap,
          onSubmitted: onSubmit,
          style: const TextStyle(color: kPurpleColor),
          obscureText: password,
          decoration: InputDecoration(
            prefixIcon: Icon(
              iconData,
              color: kPurpleColor,
            ),
            labelText: fieldText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: TextStyle(color: Colors.grey.shade600),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPurpleColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(17),
            ),
          ),
        ),
      ],
    );
  }
}

class TextModi extends StatelessWidget {
  const TextModi({
    Key? key,
    required this.text,
    this.size = 0.02,
  }) : super(key: key);

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.017 * height),
      child: Text(
        text,
        style: TextStyle(
            color: kPurpleColor,
            fontSize: size * height,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
