import 'package:flutter/cupertino.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Joined us before? ",
              style: TextStyles.font14Grey700Medium,
            ),
            TextSpan(
              text: "Login",
              style: TextStyles.font14Blue500Bold,
            ),
          ],
        ),
      ),
    );
  }
}
