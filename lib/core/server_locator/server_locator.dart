import 'package:get_it/get_it.dart';
import 'package:todo_turno/core/network/jwt_token_manager.dart';
import 'package:todo_turno/features/user/application/use_cases/login_user.dart';
import 'package:todo_turno/features/user/application/view_models/auth_view_model.dart';
import '../../features/user/domain/repositores/auth_repository.dart';
import '../../features/user/infrastructure/data_providers/auth_demo_client.dart';
import '../../features/user/infrastructure/repositories/auth_repository_impl.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  // Registrar el httpClient
  sl.registerLazySingleton<http.Client>(() => http.Client());

  // Registrar el AuthApiClient con el httpClient
  sl.registerLazySingleton<AuthDemoClient>(() => AuthDemoClient());

  // Registrar el AuthRepository con el AuthApiClient
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(apiClient: sl<AuthDemoClient>()));

  // Registrar el AuthViewModel
  sl.registerLazySingleton<AuthViewModel>(() => AuthViewModel(loginUser: sl<LoginUser>(), jwtTokenManager: sl<JwtTokenManager>()));
}