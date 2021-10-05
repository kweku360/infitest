// import 'package:flutter/material.dart';
//
// class SimpleRoundButton extends StatelessWidget {
//
//   final Color backgroundColor;
//   final Text buttonText;
//   final Color textColor;
//   final double leftrightpadding;
//   final Function onPressed;
//
//   SimpleRoundButton({
//     this.buttonText,
//     this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return new Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         ElevatedButton(
//           shape: new RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(30.0)),
//           splashColor: Colors.orange,
//           color: Colors.orange,
//           child: new Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Padding(
//                 padding: EdgeInsets.only(top: 15.0, bottom: 15.0,left: this.leftrightpadding??0,right: this.leftrightpadding??0),
//                 child: buttonText,
//               ),
//             ],
//           ),
//           onPressed: () => onPressed(),
//         ),
//
//       ],
//     );
//   }
// }