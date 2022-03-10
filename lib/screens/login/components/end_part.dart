import 'package:flutter/material.dart';
import 'package:shopclues/screens/widgets/my_button.dart';
import 'package:shopclues/screens/widgets/route.dart';

import '../../sign up/signup.dart';

class EndPart extends StatelessWidget {
  final void Function()? onPressed;
  final bool loading;
  const EndPart({
    required this.loading,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loading == true
            ? CircularProgressIndicator()
            : MyButton(
                onPressed: onPressed,
                text: "LOG IN",
              ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?\t\t"),
            GestureDetector(
              onTap: () {
                RoutingPage.goTonext(
                  context: context,
                  navigateTo: SignupPage(),
                );
              },
              child: Text("SIGN UP"),
            ),
          ],
        )
      ],
    );
  }
}
