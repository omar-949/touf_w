import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/custom_appbar.dart';
import 'package:toufwshouf/core/widgets/stack_image.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/passenger_data/BookingDateTimeWidget.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/payment_confirm/payment_method_option.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/success/BookingSuccessWidget.dart';
import '../passenger_data/CounterWidget.dart';
import '../passenger_data/progress_step_widget.dart';
import 'card_details_section.dart';
import 'checkbox_terms_section.dart';
import 'confirmation_buttons.dart';
import 'expiration_and_cvv_section.dart';

class PaymentWidget extends StatefulWidget {
  final Function(bool)? onCheckboxChanged; // Add this line
  final Function(bool)? onCheckboxChanged2;
  const PaymentWidget(
      {super.key, this.onCheckboxChanged, this.onCheckboxChanged2});

  @override
  _PaymentWidgetState createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  // Existing counters
  int _babyCount = 0;
  int _childCount = 0;
  int _adultCount = 0;
  int _dinnerCount = 0;
  int _busCount = 0;
  int _adultserCount = 0;
  bool _agreeToTerms = false;
  bool _agreeToTerms2 = false;
  bool _showPaymentConfirmation = false;
  String? _selectedPaymentMethod;
  Color firstCircleColor = TextColors.orange;
  Color secondCircleColor = TextColors.lightGrey;
  Color thirdCircleColor = TextColors.lightGrey;
  Color lineColor1 = TextColors.lightGrey;
  Color lineColor2 = TextColors.lightGrey;
  bool booking_success = false;

  void _onPayPressed() {
    setState(() {
      secondCircleColor = TextColors.orange; // Change second circle color
      lineColor1 = TextColors.orange; // Change line color
    });
  }

  void _onconfirmPressed() {
    setState(() {
      thirdCircleColor = TextColors.orange; // Change second circle color
      lineColor2 = TextColors.orange; // Change line color
    });
  }

  // Total calculation
  double get total {
    return (_babyCount * 20) +
        (_childCount * 30) +
        (_adultCount * 50) +
        (_dinnerCount * 50) +
        (_busCount * 50) +
        (_adultserCount * 50);
  }

  void _incrementadultserCounter() {
    setState(() {
      _adultserCount++;
    });
  }

  void _decrementadultserCounter() {
    setState(() {
      if (_adultserCount > 0) _adultserCount--;
    });
  }

  void _incrementbusCounter() {
    setState(() {
      _busCount++;
    });
  }

  void _decrementbusrCounter() {
    setState(() {
      if (_busCount > 0) _busCount--;
    });
  }

  void _incrementdinnerCounter() {
    setState(() {
      _dinnerCount++;
    });
  }

  void _decrementdinnerCounter() {
    setState(() {
      if (_dinnerCount > 0) _dinnerCount--;
    });
  }

  void _incrementBabyCounter() {
    setState(() {
      _babyCount++;
    });
  }

  void _decrementBabyCounter() {
    setState(() {
      if (_babyCount > 0) _babyCount--;
    });
  }

  void _incrementChildCounter() {
    setState(() {
      _childCount++;
    });
  }

  void _decrementChildCounter() {
    setState(() {
      if (_childCount > 0) _childCount--;
    });
  }

  void _incrementAdultCounter() {
    setState(() {
      _adultCount++;
    });
  }

  void _decrementAdultCounter() {
    setState(() {
      if (_adultCount > 0) _adultCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: 'Book Now',
          route: '',
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            // Make the entire body scrollable
            child: Column(children: [
          StackImage(
            imageUrl: 'assets/best_selling/header.png',
            tripName: 'The Egyptian Gulf (Hospice of the Sultan)',
          ),
          ProgressStepWidget(
            firstCircleColor:
                firstCircleColor, // Replace with your desired colors
            secondCircleColor: secondCircleColor,
            thirdCircleColor: thirdCircleColor,
            lineColor1: lineColor1,
            lineColor2: lineColor2,
          ),
          if (booking_success) BookingSuccessWidget(),
          BookingDateTimeWidget(bookingSuccess: booking_success),
          if (!booking_success)
            Container(
              width: 358.w,
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              padding: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                color: TextColors.lightwhite,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Number of people",
                      style: TextStyles.font18darkGreyMedium),
                  SizedBox(height: 10.h),
                  CounterWidget(
                    label: "Baby",
                    priceInfo: "20 EGP from 8 to 13 (year)",
                    count: _babyCount,
                    increment: _incrementBabyCounter,
                    decrement: _decrementBabyCounter,
                  ),
                  SizedBox(height: 10.h),
                  CounterWidget(
                    label: "Child",
                    priceInfo: "30 EGP From 14 to 19 (year)",
                    count: _childCount,
                    increment: _incrementChildCounter,
                    decrement: _decrementChildCounter,
                  ),
                  SizedBox(height: 10.h),
                  CounterWidget(
                    label: "Adult",
                    priceInfo: "50 EGP From 20 to 50 (year)",
                    count: _adultCount,
                    increment: _incrementAdultCounter,
                    decrement: _decrementAdultCounter,
                  ),
                ],
              ),
            ),
          if (!booking_success)
            Container(
              width: 358.w,
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              padding: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                color: TextColors.lightwhite,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Additional Services",
                      style: TextStyles.font18darkGreyMedium),
                  SizedBox(height: 10.h),
                  CounterWidget(
                    label: "Dinner",
                    priceInfo: "A Dinner meal in a 5 stars restaurant",
                    count: _dinnerCount,
                    increment: _incrementdinnerCounter,
                    decrement: _decrementdinnerCounter,
                  ),
                  SizedBox(height: 10.h),
                  CounterWidget(
                    label: "Bus",
                    priceInfo: "A Bus to drive you to your destination",
                    count: _busCount,
                    increment: _incrementbusCounter,
                    decrement: _decrementbusrCounter,
                  ),
                  SizedBox(height: 10.h),
                  CounterWidget(
                    label: "Adult",
                    priceInfo: "50 EGP From 20 to 50 (year)",
                    count: _adultserCount,
                    increment: _incrementadultserCounter,
                    decrement: _decrementadultserCounter,
                  ),
                ],
              ),
            ),
          if (!booking_success)
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: TextStyles.font24darkGreymedium),
                      Text("${total.toStringAsFixed(2)} EGP",
                          style: TextStyles.font24darkGreymedium),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text("The total includes VAT",
                      style: TextStyles.font20OrangeMedium),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        side: BorderSide(color: TextColors.grey600),
                        activeColor: TextColors.darkBlue,
                        value: _agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreeToTerms = value ?? false;
                          });
                          if (widget.onCheckboxChanged != null) {
                            widget.onCheckboxChanged!(value ?? false);
                          }
                        },
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 14.h),
                          child: RichText(
                            text: TextSpan(
                              style: TextStyles.font14darkGreyRegular,
                              children: [
                                TextSpan(
                                    text:
                                        "I Accept Terms And Conditions and Cancellation policy "),
                                TextSpan(
                                    text: "Read Terms and conditions",
                                    style:
                                        TextStyle(color: TextColors.darkBlue)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _buildPayButton(),
                  SizedBox(height: 10.h),
                  _buildAddToCartButton(),
                  if (_showPaymentConfirmation) _buildPaymentConfirmation(),
                ],
              ),
            ),
        ])));
  }

  Widget _buildPayButton() {
    return SizedBox(
      width: 358.w,
      height: 42.h,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _showPaymentConfirmation =
                true; // Show the payment confirmation container
          });
          _onPayPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),
          elevation: 0,
        ),
        child: Text("Pay", style: TextStyles.font18WhiteMedium),
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return SizedBox(
      width: 358.w,
      height: 42.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            side: BorderSide(color: Colors.orange, width: 1.0),
          ),
          elevation: 0,
        ),
        child: Text("Add to my shopping cart",
            style: TextStyles.font18OrangeMedium),
      ),
    );
  }

  Widget _buildPaymentConfirmation() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text("Choose payment method", style: TextStyles.font18darkGreyMedium),
          SizedBox(height: 10.h),
          _buildPaymentMethodOptions(),
          SizedBox(height: 20.h), // Spacing before the text fields
          CardDetailsSection(),
          SizedBox(height: 20.h), // Spacing before the new text fields
          ExpirationAndCVVSection(),
          CheckboxTermsSection(
            onCheckboxChanged: (value) {
              setState(() {
                _agreeToTerms2 = value ?? false; // Handle checkbox change
              });
            },
          ),
          SizedBox(height: 20.h), // Spacing before the buttons
          ConfirmationButtons(
            onConfirmPressed: () {
              booking_success=true;
            },
          ),
          SizedBox(height: 20.h), // Spacing at the bottom
        ],
      ),
    );
  }

  Widget _buildPaymentMethodOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PaymentMethodOption(
            assetPath: 'assets/payment/visa.png',
            method: 'visa',
            selectedMethod: _selectedPaymentMethod,
            onSelected: () {
              setState(() {
                _selectedPaymentMethod = 'visa';
              });
            }),
        SizedBox(width: 10.w), // Space between payment methods
        PaymentMethodOption(
            assetPath: 'assets/payment/mastercard.png',
            method: 'mastercard',
            selectedMethod: _selectedPaymentMethod,
            onSelected: () {
              setState(() {
                _selectedPaymentMethod = 'mastercard';
              });
            }),
        SizedBox(width: 10.w), // Space between payment methods
        PaymentMethodOption(
            assetPath: 'assets/payment/paypal.png',
            method: 'paypal',
            selectedMethod: _selectedPaymentMethod,
            onSelected: () {
              setState(() {
                _selectedPaymentMethod = 'paypal';
              });
            }),
      ],
    );
  }
}
