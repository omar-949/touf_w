import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/di/service_locator.dart';
import 'package:toufwshouf/core/helpers/shared_pref_helper.dart';
import 'package:toufwshouf/core/routing/app_router.dart';
import 'package:toufwshouf/touf_w_shouf.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();
  await ScreenUtil.ensureScreenSize();
  runApp(ToufWShouf(appRouter: AppRouter()));
}

Future<void> _initializeApp() async {
  await SharedPrefHelper.init();
  SharedPrefHelper.clearAllData();
  await setupServiceLocator();
  _lockPortraitMode();
}

void _lockPortraitMode() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}


