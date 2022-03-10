import 'package:flutter/material.dart';

class TopPart extends StatelessWidget {
  const TopPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              height: 18,
            ),
            Image.asset(
                'assets/Shopclues_logo.jpg',
                scale: 1,
            ),
          ],
        ),
      ],
    );
  }
}
