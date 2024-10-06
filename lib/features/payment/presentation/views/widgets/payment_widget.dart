import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/CounterWidget.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/container_data.dart';

class PaymentWidget extends StatefulWidget {
  final Function(bool)? onCheckboxChanged; // Add this line
  const PaymentWidget({super.key, this.onCheckboxChanged});

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
  bool _showPaymentConfirmation = false;
  String? _selectedPaymentMethod;

  // Total calculation
  double get total {
    return (_babyCount * 20) + (_childCount * 30) + (_adultCount * 50) +
        (_dinnerCount * 50) + (_busCount * 50) + (_adultserCount * 50);
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Make the entire body scrollable
        child: Column(
          children: [
            DateContainer(
              iconPath: 'assets/payment/lets-icons_date-today.png',
              label: "Trip date:",
              date: "2/3/2022",
            ),
            DateContainer(
              iconPath: 'assets/payment/clock.png',
              label: "Time:",
              date: "18:00",
            ),
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

               Padding(
                 padding: EdgeInsets.only(left: 16.w,right: 16.w),
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
                                      text: "I Accept Terms And Conditions and Cancellation policy "),
                                  TextSpan(text: "Read Terms and conditions",
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 358.w,
                      height: 42.h,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showPaymentConfirmation =
                            true; // Show the payment confirmation container
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: TextColors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                          ),
                          elevation: 0,
                        ),
                        child: Text("Pay", style: TextStyles.font18WhiteMedium),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
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
                    ),
                    if (_showPaymentConfirmation) // Display payment confirmation when true
                      SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10.h),
                              Text("Choose payment method",
                                  style: TextStyles.font18darkGreyMedium),
                              SizedBox(height: 10.h),
                               Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedPaymentMethod = 'visa'; // Set selected method
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          color: TextColors.light2white,
                                          border: _selectedPaymentMethod == 'visa'
                                              ? Border.all(color: Colors.orange, width: 2)
                                              : null,
                                        ),
                                        width: 107.w,
                                        height: 53.h,
                                        child: Center(child: Image.network('assets/payment/visa.png')), // Use Image.asset for local assets
                                      ),
                                    ),
                                    SizedBox(width: 10.w), // Add space between payment methods
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedPaymentMethod = 'mastercard'; // Set selected method
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          color: TextColors.light2white,
                                          border: _selectedPaymentMethod == 'mastercard'
                                              ? Border.all(color: Colors.orange, width: 2)
                                              : null,
                                        ),
                                        width: 107.w,
                                        height: 53.h,
                                        child: Center(child: Image.network('assets/payment/mastercard.png')), // Use Image.asset for local assets
                                      ),
                                    ),
                                    SizedBox(width: 10.w), // Add space between payment methods
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedPaymentMethod = 'paypal'; // Set selected method
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          color: TextColors.light2white,
                                          border: _selectedPaymentMethod == 'paypal'
                                              ? Border.all(color: Colors.orange, width: 2)
                                              : null,
                                        ),
                                        width: 107.w,
                                        height: 53.h,
                                        child: Center(child: Image.network('assets/payment/paypal.png')), // Use Image.asset for local assets
                                      ),
                                    ),
                                  ],
                                ),

                              SizedBox(height: 20.h), // Spacing before the text fields
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Credit Card',
                                  hintText: '3485 ****  ****  ****',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                ),
                              ),
                              SizedBox(height: 10.h), // Spacing between text fields
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Name on card',
                                  hintText: 'Joe Doe',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                ),
                              ),
                            ],
                          ),
                        ),


                  ],
                               ),
               ),

          ],
        ),
      ),
    );
  }
}
