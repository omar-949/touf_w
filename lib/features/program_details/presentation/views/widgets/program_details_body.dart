import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_action_button.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_header.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_tab_bar.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_information.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/related_trips.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/tour_details.dart';
import 'package:toufwshouf/main.dart';

class ProgramDetailsBody extends StatelessWidget {
  const ProgramDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const ProgramDetailsHeader(),
        const ProgramActionButtons(),
        const ProgramInformation(),
        const ProgramDetailsTabBar(),
        const TourDetails(),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomButton(
              text: 'Book Now',
              borderRadius: BorderRadius.circular(12.w),
              onPressed: () {
                isLoggedUser
                    ? context.pushNamed(Routes.paymentView)
                    : context.showCustomDialog(
                        title: Text("error"),
                        content: Text("You are not logded in"),
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
                        ));
              },
            ),
          ),
        ),
        const RelatedTrips(),
      ],
    );
  }
}
