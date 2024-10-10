import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:toufwshouf/core/networking/api_service.dart';
import 'package:toufwshouf/core/networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getInstance();
  getIt.registerSingleton<ApiService>(ApiService(dio));
  // Repos
}
