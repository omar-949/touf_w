import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/custom_selector.dart';
import 'package:toufwshouf/features/payment/data/models/extra_model/extra_model.dart';

class BookingDetailsAdditionalWidget extends StatefulWidget {
  final List<ExtraModel> additionalServices;
  final VoidCallback onUpdate;


  const BookingDetailsAdditionalWidget({
    super.key,
    required this.additionalServices, required this.onUpdate,
  });

  @override
  _BookingDetailsAdditionalWidgetState createState() =>
      _BookingDetailsAdditionalWidgetState();
}

class _BookingDetailsAdditionalWidgetState extends State<BookingDetailsAdditionalWidget> {
  late List<ExtraModel> services;

  @override
  void initState() {
    super.initState();
    services = widget.additionalServices; // نسخ البيانات عند الإنشاء
  }

  void _incrementCount(ExtraModel service) {
    setState(() {
      service.incrementCount();
      widget.onUpdate(); // استدعاء دالة التحديث هنا
    });
  }

  void _decrementCount(ExtraModel service) {
    setState(() {
      service.decrementCount();
      widget.onUpdate(); // استدعاء دالة التحديث هنا
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
      padding: EdgeInsets.symmetric(vertical: 10.h), // إضافة Padding داخلي
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Additional Services",
            style: TextStyles.font18darkGreyMedium,
          ),
          SizedBox(height: 16.h),
          ...services.map((service) => Padding(
            padding: EdgeInsets.only(bottom: 16.0.h),
            child: _buildAdditionalServiceSelector(service),
          )).toList(),
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
        _incrementCount(service); // استخدم الدالة للتحديث
      },
      onRemove: () {
        _decrementCount(service); // استخدم الدالة للتحديث
      },
    );
  }
}

