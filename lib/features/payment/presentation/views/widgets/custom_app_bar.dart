import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
    //  mainAxisAlignment: MainAxisAlignment.,
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new_outlined)),
SizedBox(width: 120.w,),
        Text("Book Now",style:TextStyles.font16BlackMedium,),
      ],
    );
  }
}
