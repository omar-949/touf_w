import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/di/service_locator.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/helpers/shared_pref_helper.dart';
import 'package:toufwshouf/core/helpers/shared_pref_keys.dart';
import 'package:toufwshouf/core/routing/app_router.dart';
import 'package:toufwshouf/touf_w_shouf.dart';

bool isLoggedUser = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();
  runApp(ToufWShouf(appRouter: AppRouter()));
}

Future<void> _initializeApp() async {
  await setupServiceLocator();
  await _checkIfLoggedUser();
  // fixed screen util text bug in release mode
  await ScreenUtil.ensureScreenSize();
  _setSystemUIStyles();
  _lockPortraitMode();
}

void _setSystemUIStyles() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
    ),
  );
}


void _lockPortraitMode() {
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

Future<void> _checkIfLoggedUser() async {
  String? userToken = await SharedPrefHelper.getString(key: SharedPrefKeys.accessToken);
  isLoggedUser = userToken.isNotNullOrEmpty();
}
