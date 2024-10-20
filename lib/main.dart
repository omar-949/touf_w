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
  await ScreenUtil.ensureScreenSize(); // Ensure this line is executed
  runApp(ToufWShouf(appRouter: AppRouter()));
}

Future<void> _initializeApp() async {
  await setupServiceLocator();
  await _checkIfLoggedUser();
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

Future<void> _checkIfLoggedUser() async {
  String? userToken =
      await SharedPrefHelper.getString(key: SharedPrefKeys.accessToken);
  isLoggedUser = userToken.isNotNullOrEmpty();
  print (isLoggedUser);
  print(userToken);
  print(SharedPrefKeys.accessToken);
}
