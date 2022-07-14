import 'package:flutter/material.dart';
import 'package:dating/components/constants.dart';
import 'package:dating/widgets/input_data.dart';
import 'package:dating/widgets/signin_button.dart';
import 'package:flutter_tags/flutter_tags.dart';

double height = 0;
double width = 0;
int _height = 150;
int _weight = 60;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String id = "signup_screen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? gender;
  int age = 18;
  int _activeStepIndex = 0;
  List _interests = [];

  TextEditingController emailController = TextEditingController();
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  genderChange(Object? value) {
    setState(() {
      gender = value.toString();
    });
  }

  changeadd(bool isHeight) {
    setState(() {
      isHeight ? _height++ : _weight++;
    });
  }

  changesub(bool isHeight) {
    setState(() {
      isHeight ? _height-- : _weight--;
    });
  }

//list of diiferent forms to be used in stepper widget
  List<Step> getSteps() => [
        //Sign up Details
        Step(
          title: const Text(
            "",
          ),
          isActive: _activeStepIndex >= 0,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputData(
                iconData: Icons.email_outlined,
                text: 'Email Address',
                fieldText: 'Enter Email Address',
                controller: emailController,
              ),
              Row(
                children: [
                  Flexible(
                      child: InputData(
                    iconData: Icons.person_outline_outlined,
                    text: 'First Name',
                    fieldText: 'First Name',
                    controller: firstController,
                  )),
                  SizedBox(
                    width: 0.07 * width,
                  ),
                  Flexible(
                      child: InputData(
                    iconData: Icons.person_outline_outlined,
                    text: 'Last Name',
                    fieldText: 'Last Name',
                    controller: lastController,
                  )),
                ],
              ),
              InputData(
                iconData: Icons.lock_outline_rounded,
                text: 'Password',
                fieldText: 'Password',
                password: true,
                controller: passwordController,
              ),
              const TextModi(text: 'Gender'),
              Row(
                children: [
                  GenderSelector(
                    gender: gender,
                    text: "Male",
                    value: "male",
                    onTouch: genderChange,
                  ),
                  SizedBox(
                    width: 0.07 * width,
                  ),
                  GenderSelector(
                      gender: gender,
                      text: "Female",
                      value: "female",
                      onTouch: genderChange),
                ],
              ),
              InputData(
                text: "Date of Birth",
                iconData: Icons.cake_outlined,
                fieldText: "Date of Birth",
                controller: dobController,
                ontap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1980),
                    lastDate: DateTime.now(),
                  );

                  if (picked != null) {
                    setState(() {
                      dobController.text = "${picked.toLocal()}".split(' ')[0];
                    });
                  }
                },
              ),
            ],
          ),
        ),
        //Basic Info and interests
        Step(
            title: const Text(""),
            isActive: _activeStepIndex >= 1,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Age
                const TextModi(text: "Age"),
                Container(
                  height: 0.07 * height,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade500),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        valueIndicatorColor: kBackgroundColor,
                        valueIndicatorTextStyle:
                            const TextStyle(color: kPurpleColor),
                        thumbColor: kPinkColor,
                        activeTrackColor: kPurpleColor,
                        inactiveTrackColor: kPurpleColor),
                    child: Slider(
                      label: age.toString(),
                      divisions: 52,
                      min: 18,
                      max: 70,
                      value: age.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          age = value.toInt();
                        });
                      },
                    ),
                  ),
                ),
                //Height n Weight
                Row(
                  children: [
                    HeightNWeight(
                      add: changeadd,
                      sub: changesub,
                      isHeight: true,
                      data: _height,
                      label: 'Height (cms)',
                    ),
                    SizedBox(
                      width: 0.07 * width,
                    ),
                    HeightNWeight(
                      isHeight: false,
                      add: changeadd,
                      sub: changesub,
                      data: _weight,
                      label: 'Weight(kgs)',
                    ),
                  ],
                ),
                //Interests

                InputData(
                  text: 'Interests',
                  controller: tagsController,
                  fieldText: 'Add a interest',
                  iconData: Icons.tag,
                  onSubmit: (str) {
                    setState(() {
                      _interests.add(str);
                      tagsController.clear();
                    });
                  },
                ),
                SizedBox(
                  height: 0.015 * height,
                ),
                Tags(
                  alignment: WrapAlignment.start,
                  itemCount: _interests.length,
                  itemBuilder: (index) {
                    final item = _interests[index];

                    return ItemTags(
                      pressEnabled: false,
                      key: Key(index.toString()),
                      index: index,
                      title: item,
                      padding: const EdgeInsets.all(8),
                      activeColor: kPinkColor,
                      textActiveColor: kPurpleColor,
                      removeButton: ItemTagsRemoveButton(onRemoved: () {
                        setState(() {
                          _interests.removeAt(index);
                        });
                        return true;
                      }),
                    );
                  },
                ),
                InputData(
                  controller: locationController,
                  text: "Location",
                  fieldText: 'Enter Location',
                  iconData: Icons.location_on_outlined,
                  ontap: () {},
                )
              ],
            )),
        Step(
          title: const Text(
            "",
          ),
          isActive: _activeStepIndex >= 2,
          content: Container(
            height: 30,
            width: 30,
            color: kPurpleColor,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    height = getHeight(context);
    width = getWidth(context);
    return Scaffold(
      body: SafeArea(
        child: Theme(
          data: ThemeData(
            canvasColor: kBackgroundColor,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: kPurpleColor,
                  secondary: kPinkColor,
                ),
          ),
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _activeStepIndex,
            steps: getSteps(),
            margin: EdgeInsets.symmetric(horizontal: 0.07 * width),
            elevation: 0,
            onStepContinue: () {
              if (_activeStepIndex < (getSteps().length - 1)) {
                setState(() {
                  _activeStepIndex += 1;
                });
              } else {
                print("Submitted");
              }
            },
            onStepCancel: () {
              if (_activeStepIndex == 0) {
                return;
              } else {
                setState(() {
                  _activeStepIndex -= 1;
                });
              }
            },
            onStepTapped: (int index) {
              setState(() {
                _activeStepIndex = index;
              });
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Column(
                children: [
                  SizedBox(
                    height: 0.03 * height,
                  ),
                  SignInButton(
                    heightPercent: 0.073,
                    marginWidthPercent: 0.0,
                    text: _activeStepIndex == 2 ? 'Submit' : 'Continue',
                    noIcon: true,
                    onTap: details.onStepContinue,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class HeightNWeight extends StatelessWidget {
  const HeightNWeight({
    Key? key,
    required this.data,
    required this.label,
    required this.add,
    required this.sub,
    required this.isHeight,
  }) : super(key: key);

  final int data;
  final String label;
  final bool isHeight;
  final void Function(bool) add;
  final void Function(bool) sub;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextModi(text: label),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade500),
                borderRadius: BorderRadius.circular(17)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextModi(
                    text: isHeight ? _height.toString() : _weight.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        add(isHeight);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 10,
                          right: 3,
                        ),
                        height: 0.062 * height,
                        width: 0.062 * height,
                        decoration: BoxDecoration(
                            color: kPinkColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Center(child: TextModi(text: "+")),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        sub(isHeight);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 10,
                          left: 3,
                        ),
                        height: 0.062 * height,
                        width: 0.062 * height,
                        decoration: BoxDecoration(
                            color: kPinkColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Center(child: TextModi(text: "-")),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Radio buttons to choose your gender between male and female in signup section
class GenderSelector extends StatelessWidget {
  const GenderSelector({
    Key? key,
    required this.gender,
    required this.text,
    required this.value,
    required this.onTouch,
  }) : super(key: key);

  final String? gender;
  final String text;
  final String value;
  final void Function(Object?) onTouch;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 0.069 * height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: Colors.grey.shade500)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Radio(
              visualDensity: const VisualDensity(horizontal: -4),
              focusColor: kPinkColor,
              hoverColor: kPinkColor,
              activeColor: kPurpleColor,
              value: value,
              groupValue: gender,
              onChanged: (value) {
                onTouch(value);
              },
            ),
            Icon(
              Icons.male_rounded,
              color: kPurpleColor,
              size: 0.038 * height,
            ),
            TextModi(text: text),
            SizedBox(
              width: 0.01 * width,
            ),
          ],
        ),
      ),
    );
  }
}
