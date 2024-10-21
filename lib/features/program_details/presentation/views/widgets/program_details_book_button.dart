import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/main.dart';

class ProgramDetailsBookButton extends StatelessWidget {
  const ProgramDetailsBookButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomButton(
          text: 'Book Now',
          borderRadius: BorderRadius.circular(12.r),
          onPressed: () {
            isLoggedUser
                ? context.pushNamed(Routes.paymentView)
                : context.showCustomDialog(
                    title: const Text("error"),
                    content: const Text("You are not logged in"),
                    confirmButton: CustomButton(
                      text: "Go to Login",
                      onPressed: () {
                        context.pushNamed(Routes.loginView);
                      },
                    ),
                    cancelButton: CustomButton(
                      text: "cancel",
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
