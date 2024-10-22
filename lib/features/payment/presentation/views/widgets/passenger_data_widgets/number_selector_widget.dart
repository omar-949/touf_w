import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/passenger_data_widgets/custom_counter_widget.dart';
import '../../../../../../core/resources/styles.dart';

class NumberSelectorWidget extends StatelessWidget {
  final String label;
  final String price;
  final int count;
  final Function() onAdd;
  final Function() onRemove;

  const NumberSelectorWidget({
    super.key,
    required this.label,
    required this.price,
    required this.count,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 195.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyles.font16Grey500Medium
                    .copyWith(color: Colors.black),
              ),
              8.verticalSpace,
              Row(
                children: [
                  Text("price : ", style: TextStyles.font14darkBlue400Regular),
                  8.horizontalSpace,
                  Text(
                    price,
                    style: TextStyles.font14darkBlue400Regular,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        CustomCounterWidget(
          count: count,
          onAdd: onAdd,
          onRemove: onRemove,
        ),
      ],
    );
  }
}
class CountSelectorAdditionalService extends StatelessWidget {
  final String label;
  final String price,description;
  final int count;
  final Function() onAdd;
  final Function() onRemove;

  const CountSelectorAdditionalService({
    super.key,
    required this.label,
    required this.price,
    required this.count,
    required this.onAdd,
    required this.onRemove, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 210.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyles.font16Grey500Medium
                    .copyWith(color: Colors.black),
              ),
              8.verticalSpace,
              Text(
                description,
                style: TextStyles.font14darkBlue400Regular,
              ),
              8.verticalSpace,
              Row(
                children: [
                  Text("Price : ", style: TextStyles.font14darkBlue400Regular),
                  8.horizontalSpace,
                  Text(
                    price,
                    style: TextStyles.font14darkBlue400Regular,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        CustomCounterWidget(
          count: count,
          onAdd: onAdd,
          onRemove: onRemove,
        ),
      ],
    );
  }
}

