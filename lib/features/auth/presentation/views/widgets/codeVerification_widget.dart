import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/routing/app_router.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Header_widget.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/custom_button.dart';

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

    final containerHeight = 0.50 * height;
    final textPadding = 0.04 * width;
    const buttonWidth = 323.0;
    const buttonHeight = 39.0;
    double getFontSize(double scaleFactor) => scaleFactor * width / 100;
    final focusNodes = List<FocusNode>.generate(6, (index) => FocusNode());
    final otpController = TextEditingController();

    @override
    void dispose() {
      otpController.dispose();
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
                 Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left:width * 0.05,right:width * 0.05 ,),
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
                                    _buildOtpDigitField(
                                      context,
                                      focusNodes[i],
                                      i < 5 ? focusNodes[i + 1] : null,
                                      getFontSize(8),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 30),
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
                    ],
                  ),

                SizedBox(height: height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOtpDigitField(BuildContext context, FocusNode currentFocus, FocusNode? nextFocus, double fieldWidth) {
    return Container(
      width: 54.w,
      height: 54.h, // Set the height and width for the container
      margin: EdgeInsets.symmetric(horizontal: fieldWidth * 0.1),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blue, width: 2), // Use Border.all for consistent border
      ),
      child: TextFormField(
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fieldWidth * 0.6),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.blue, width: 2), // Keep the color and width same
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.blue, width: 2), // Keep the color and width same
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.red, width: 2), // Keep the color and width same
          ),
          contentPadding: EdgeInsets.zero, // Ensure no extra padding
        ),
        onChanged: (value) {
          if (value.length == 1 && nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
      ),
    );
  }



}
