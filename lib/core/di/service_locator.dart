import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:toufwshouf/core/networking/api_service.dart';
import 'package:toufwshouf/core/networking/dio_factory.dart';
import 'package:toufwshouf/features/best_selling/data/repos/home_repo_impl.dart';
import '../../features/auth/data/repos/auth_repo/auth_repo_impl.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  //dio & ApiService
  Dio dio = await DioFactory.getInstance();
  getIt.registerSingleton<ApiService>(ApiService(dio));
  //repos
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<ActiveProgramRepoImpl>(ActiveProgramRepoImpl(getIt.get<ApiService>()));
}
