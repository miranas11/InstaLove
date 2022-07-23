import 'package:flutter/material.dart';
import 'package:dating/components/constants.dart';
import '../models/person_class.dart';

class PersonBox extends StatefulWidget {
  final Person? person;

  const PersonBox({
    Key? key,
    this.person,
  }) : super(key: key);

  @override
  State<PersonBox> createState() => _PersonBoxState();
}

class _PersonBoxState extends State<PersonBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/demo.jfif',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Mir Anas, 23',
                  style: TextStyle(
                      color: kBackgroundColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                Text('20 mi',
                    style: TextStyle(
                      color: kBackgroundColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ))
              ],
            )),
        const Positioned(
          bottom: 20,
          right: 30,
          child: Icon(
            Icons.heart_broken,
            size: 48,
          ),
        ),
      ],
    );
  }
}

// class PersonBox extends StatelessWidget {
//   const PersonBox({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             // constraints: const BoxConstraints.expand(),
//             child: Image.asset(
//               'assets/images/demo.jfif',
//               fit: BoxFit.fill,
//             ),
//           ),
//         ),
//         Positioned(
//             bottom: 20,
//             left: 20,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   'Mir Anas, 23',
//                   style: TextStyle(
//                       color: kBackgroundColor,
//                       fontSize: 22,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 Text('20 mi',
//                     style: TextStyle(
//                       color: kBackgroundColor,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w400,
//                     ))
//               ],
//             )),
//         const Positioned(
//           bottom: 20,
//           right: 30,
//           child: Icon(
//             Icons.heart_broken,
//             size: 48,
//           ),
//         ),
//       ],
//     );
//   }
// }
