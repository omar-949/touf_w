import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toufwshouf/core/routing/app_router.dart';
import 'package:toufwshouf/core/routing/routes.dart';


class ToufWShouf extends StatelessWidget {
  const ToufWShouf({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme(textTheme)),
        initialRoute: Routes.resetpassScreen,
        onGenerateRoute: appRouter.generateRouter,
      ),
    );
  }
}
