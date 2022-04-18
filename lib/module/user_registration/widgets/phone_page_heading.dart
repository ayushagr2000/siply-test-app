import 'package:flutter/material.dart';

class PhonePageHeading extends StatelessWidget {
  const PhonePageHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Center(
        child: RichText(
          text: const TextSpan(
              text: 'Welcome to ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              children: [
                TextSpan(
                    text: ' CHHOTA ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                TextSpan(
                    text: 'STOCK',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.black))
              ]),
        ),
      ),
    );
  }
}
