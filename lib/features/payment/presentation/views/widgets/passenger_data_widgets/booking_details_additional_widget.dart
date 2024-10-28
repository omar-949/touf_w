import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/passenger_data_widgets/number_selector_widget.dart';
import 'package:toufwshouf/features/payment/data/models/extra_model/extra_model.dart';



class BookingDetailsAdditionalWidget extends StatefulWidget {
  final List<ExtraModel> additionalServices;
  final VoidCallback onUpdate;


  const BookingDetailsAdditionalWidget({
    super.key,
    required this.additionalServices, required this.onUpdate,
  });

  @override
  State<BookingDetailsAdditionalWidget> createState() => _BookingDetailsAdditionalWidgetState();
}

class _BookingDetailsAdditionalWidgetState extends State<BookingDetailsAdditionalWidget> {
  late List<ExtraModel> services;

  @override
  void initState() {
    super.initState();
    services = widget.additionalServices;
  }

  void _incrementCount(ExtraModel service) {
    setState(() {
      service.incrementCount();
      widget.onUpdate();
    });
  }

  void _decrementCount(ExtraModel service) {
    setState(() {
      service.decrementCount();
      widget.onUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfffffbfb),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Additional Services",
            style: TextStyles.font18darkGreyMedium,
          ),
          SizedBox(height: 16.h),
          ...services.map((service) => Padding(
            padding: EdgeInsets.only(bottom: 16.0.h,left: 10.w,right: 10.w),
            child: _buildAdditionalServiceSelector(service),
          )),
        ],
      ),
    );
  }

  Widget _buildAdditionalServiceSelector(ExtraModel service) {
    return CountSelectorAdditionalService(
      label: service.extSrv ?? "",
      price: service.extPrice?.toString() ?? '0',
      description: service.extDescr ?? "",
      count: service.count,
      onAdd: () {
        _incrementCount(service);
      },
      onRemove: () {
        _decrementCount(service);
      },
    );
  }
}

