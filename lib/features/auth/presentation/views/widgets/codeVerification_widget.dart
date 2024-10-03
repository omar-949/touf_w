import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/routing/app_router.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Header_widget.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/custom_button.dart';
class VerifyPasswordWidget extends StatefulWidget {


  const VerifyPasswordWidget({
    super.key,
  });

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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Header(
                  logoAsset: "assets/auth/code_validation.png",
                  imageAsset: "assets/auth/code_validation.png",
                ),
                Text("Code validation",style:TextStyles.font26GreyExtraBold),
                Text("Please enter the 4 digit code sent to your mobile number +40 700 000 000",style:TextStyles.font14GreyMedium),
                Padding(
                  padding: EdgeInsets.only(top: 0.04 * height),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(width * 0.05),
                        child: Container(
                          width: width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color(0x80FBD57D),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 0.09 * containerHeight),
                              Padding(
                                padding: EdgeInsets.only(left: textPadding),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Enter Verification Code",
                                      style: TextStyle(
                                        fontFamily: 'Comfortaa',
                                        color: const Color(0xFF101623),
                                        fontSize: getFontSize(5),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 9),
                              Padding(
                                padding: EdgeInsets.only(left: textPadding),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Enter the code we have sent to your number",
                                        style: TextStyle(
                                          color: const Color(0xFFA1A8B0),
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w400,
                                          fontSize: getFontSize(3.5),
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: textPadding),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "012345678***",
                                      style: TextStyle(
                                        color: const Color(0xFF101623),
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.w400,
                                        fontSize: getFontSize(3),
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0; i < 3; i++)
                                    _buildOtpDigitField(
                                      context,
                                      focusNodes[i],
                                      focusNodes[i + 1],
                                      getFontSize(8),
                                    ),
                                  SizedBox(width: getFontSize(8)),
                                  for (int i = 3; i < 6; i++)
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
                                      }
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
      width: fieldWidth,
      height: fieldWidth * 1.2,
      margin: EdgeInsets.symmetric(horizontal: fieldWidth * 0.1),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF04C29), width: 2),
        ),
      ),
      child: TextFormField(
        focusNode: currentFocus,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fieldWidth * 0.6),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: "", // Hide the counter text
          border: InputBorder.none,
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