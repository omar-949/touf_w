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
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true, // Ensures better handling of screen split mode
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme:
                GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
            scaffoldBackgroundColor: Colors.white,
          ),
          initialRoute: Routes.codeVerificationScreen,
          onGenerateRoute: appRouter.generateRouter,
        );
      },
    );
  }
}
