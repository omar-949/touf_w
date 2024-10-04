import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Header_widget.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Navigation_link.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/otpdigitfield.dart';

class VerifyPasswordWidget extends StatefulWidget {
  const VerifyPasswordWidget({super.key});

  @override
  State<VerifyPasswordWidget> createState() => _VerifyPasswordWidgetState();
}

class _VerifyPasswordWidgetState extends State<VerifyPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    final focusNodes = List<FocusNode>.generate(4, (index) => FocusNode());
    final otpController = TextEditingController();

    @override
    void dispose() {
      otpController.dispose();
      for (var focusNode in focusNodes) {
        focusNode.dispose(); // Dispose of each FocusNode
      }
      super.dispose();
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Header(
                  logoAsset: "assets/logo_en 2.png",
                  imageAsset: "assets/auth/code_validation.png",
                ),
                SizedBox(height: 10.h,),
                Text(
                  "Code validation",
                  style: TextStyles.font26GreyExtraBold,
                ),
                SizedBox(height: 10.h,),
                Text(
                  "Please enter the 4 digit code sent to your mobile number +40 700 000 000",
                  textAlign: TextAlign.center, // Center the text
                  style: TextStyles.font14GreyMedium,
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Container(
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 4; i++)
                              OtpDigitField(
                                currentFocus: focusNodes[i],
                                nextFocus: i < 3 ? focusNodes[i + 1] : null,
                                fieldWidth:40.sp,
                              ),
                          ],
                        ),
                        NavigationLink(
                          questionText: "Didn’t get the code?",
                          actionText: "Resend code",
                          onPressed: () => Navigator.of(context).pushNamed(Routes.loginScreen),
                        ),
                        SizedBox(height: 60.h),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: CustomButton(
                              text: "Verify",
                              onPressed: () async {
                                Navigator.of(context).pushNamed(Routes.homeScreen);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

