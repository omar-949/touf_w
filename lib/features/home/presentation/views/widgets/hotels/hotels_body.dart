import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/hotels/custom_container_hotel.dart';

import '../../../../../../core/resources/assets.dart';


class HotelsBody extends StatelessWidget {
  const HotelsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding:  EdgeInsets.only(bottom: 2.h),
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, bottom: 15.h),
                child: Row(
                  children: [
                    Text(
                      "Search Result",
                      style: TextStyles.font18darkGreyMedium,
                    ),
                    Text(
                      "(50 Hotels)",
                      style: TextStyles.font16darkGreyMedium,
                    )
                  ],
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomContainerHotel(
                        imageUrl: Assets.hotelsImage,
                        containerText2: "Start From",
                        containerSalary2: "850 EGP",
                        textHeader:
                            "Private Egyptian Felucca Ride On The Nile With traditional lunch",
                        textDesc:
                            "A short felucca trip on the Nile in Cairo Felucca cruise in Cairo a representative of Emo Tours will pick you up from your hotel...",
                        textCheck: "Free Cancellation",
                        textDate: "2 nights",
                        rate: 3.5);
                  })
            ],

        ),
      );

  }
}
