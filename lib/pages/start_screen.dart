import 'package:dating/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:dating/widgets/signin_button.dart';

double height = 0;
double width = 0;

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);
  static const String id = 'start_screen';

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    height = getHeight(context);
    width = getWidth(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/login_icon.png',
              height: 0.3 * height,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                StartText(
                  text: 'Create Your\nFree Account',
                  fontweight: FontWeight.w500,
                  sizePercent: 0.033,
                ),
                StartText(
                  text: 'Sign up and start meeting new people',
                  sizePercent: 0.023,
                  fontweight: FontWeight.w500,
                ),
                StartText(
                  text:
                      'God himself,sir,does not propose to judge man until the end of his days',
                  sizePercent: 0.021,
                  color: Colors.grey,
                ),
              ],
            ),
            SignInButton(
              onTap: () => Navigator.pushNamed(context, "signup_screen"),
              text: 'Sign up with Google',
              icon: Icons.login,
            ),
            SignInButton(
              text: 'Sign up with Email',
              onTap: () => Navigator.pushNamed(context, "signup_screen"),
              icon: Icons.email_outlined,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widthgap * width, vertical: 0.02 * height),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const StartText(
                    text: 'Already have\nan account',
                    sizePercent: 0.019,
                    fontweight: FontWeight.w500,
                    horizontalPadding: 0,
                    verticalPadding: 0,
                  ),
                  SizedBox(width: 0.15 * width),
                  Expanded(
                    child: SignInButton(
                      onTap: () => print('Sign In'),
                      text: 'Sign In',
                      colorText: Colors.black,
                      icon: Icons.email_outlined,
                      colorIcon: Colors.black,
                      color: kPinkColor,
                      heightPercent: 0.06,
                      marginWidthPercent: 0.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StartText extends StatelessWidget {
  const StartText({
    this.text = '',
    this.sizePercent = 0.03,
    this.fontweight = FontWeight.normal,
    this.color = Colors.black,
    this.horizontalPadding = widthgap,
    this.verticalPadding = 0.012,
    Key? key,
  }) : super(key: key);

  final String text;
  final double sizePercent;
  final FontWeight fontweight;
  final Color color;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding * width,
          vertical: verticalPadding * height),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: sizePercent * height,
          fontWeight: fontweight,
        ),
      ),
    );
  }
}
