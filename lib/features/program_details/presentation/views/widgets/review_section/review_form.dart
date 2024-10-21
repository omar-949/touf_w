import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Write your review “The Egyptian Gulf”',
            style: TextStyles.font18BlackRegular,
          ),
          SizedBox(height: 8.h),
          Text(
            'Reviews',
            style: TextStyles.font18BlackMedium,
          ),
          SizedBox(height: 16.h),
          _buildReviewTextField(),
          SizedBox(height: 16.h),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildReviewTextField() {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: TextFormField(
        maxLines: 4,
        cursorColor: AppColors.orange,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffFAFAFA),
          enabledBorder: _buildInputBorder(Colors.transparent),
          focusedBorder: _buildInputBorder(Colors.transparent),
          errorBorder: _buildInputBorder(Colors.red),
          focusedErrorBorder: _buildInputBorder(Colors.red),
          hintText: 'Write your feedback',
          hintStyle: TextStyles.font16grey400Regular,
          contentPadding: EdgeInsets.all(12.w),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your review';
          }
          return null;
        },
        style: TextStyles.font16BlackRegular,
      ),
    );
  }

  OutlineInputBorder _buildInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: color),
    );
  }

  Widget _buildSubmitButton() {
    return CustomButton(
      onPressed: () {
        setState(() {
          autoValidateMode = AutovalidateMode.always;
        });

        if (_formKey.currentState?.validate() ?? false) {
        }
      },
      text: 'Submit',
      width: 160.w,
    );
  }
}
