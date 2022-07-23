import 'package:dating/components/constants.dart';
import 'package:dating/pages/main_screen.dart';
import 'package:dating/pages/signup_screen.dart';
import 'package:dating/pages/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
            valueIndicatorColor: kPurpleColor,
            thumbColor: kPinkColor,
            activeTrackColor: kPurpleColor,
            inactiveTrackColor: kPurpleColor),
        unselectedWidgetColor: Colors.grey.shade600,
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(
            color: kBackgroundColor,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: kBackgroundColor,
                statusBarIconBrightness: Brightness.dark)),
      ),
      initialRoute: StartScreen.id,
      routes: {
        StartScreen.id: (context) => const StartScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        MainScreen.id: (context) => const MainScreen(),
      },
    );
  }
}
