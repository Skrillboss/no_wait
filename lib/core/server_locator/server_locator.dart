import 'package:get_it/get_it.dart';
import 'package:todo_turno/core/network/jwt_token_manager.dart';
import 'package:todo_turno/features/item/infrastructure/data_providers/read/read_item_api_client.dart';
import 'package:todo_turno/features/item/infrastructure/data_providers/update/update_item_api_client.dart';
import 'package:todo_turno/features/user/application/use_cases/login_user.dart';
import 'package:todo_turno/features/user/application/view_models/auth_view_model.dart';
import '../../features/item/domain/repositories/create_item_repository.dart';
import '../../features/item/domain/repositories/read_item_repository.dart';
import '../../features/item/domain/repositories/update_item_repository.dart';
import '../../features/item/infrastructure/data_providers/create/create_item_api_client.dart';
import '../../features/item/infrastructure/data_providers/create/create_item_demo_client.dart';
import '../../features/item/infrastructure/data_providers/read/read_item_demo_client.dart';
import '../../features/item/infrastructure/data_providers/update/update_item_demo_client.dart';
import '../../features/item/infrastructure/repositories/create_item_repository_impl.dart';
import '../../features/item/infrastructure/repositories/read_item_repository_impl.dart';
import '../../features/item/infrastructure/repositories/update_item_repository_impl.dart';
import '../../features/user/domain/repositories/auth_repository.dart';
import '../../features/user/infrastructure/data_providers/auth_api_client.dart';
import '../../features/user/infrastructure/data_providers/auth_demo_client.dart';
import '../../features/user/infrastructure/repositories/auth_repository_impl.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

void setupServiceLocator() {

  // Registering the httpClient
  sl.registerLazySingleton<http.Client>(() => http.Client());

  /* ************************************************************************ */
  /* ********************************  User  ******************************** */
  /* ************************************************************************ */

  // Registering the AuthDemoClient DEMO
  sl.registerLazySingleton<AuthDemoClient>(() => AuthDemoClient());

  // Registering the AuthApiClient API
  sl.registerLazySingleton<AuthApiClient>(() => AuthApiClient(httpClient: sl<http.Client>()));

  // Registering the AuthRepository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(apiClient: sl<AuthDemoClient>()));

  // Registering the AuthViewModel
  sl.registerLazySingleton<AuthViewModel>(() => AuthViewModel(loginUser: sl<LoginUser>(), jwtTokenManager: sl<JwtTokenManager>()));

  /* ************************************************************************ */
  /* ********************************  Item  ******************************** */
  /* ************************************************************************ */

  /* *****************  CREATE  *****************/

  // Registering the CreateItemDemoClient DEMO
  sl.registerLazySingleton<CreateItemDemoClient>(() => CreateItemDemoClient());

  // Registering the CreateApiDemoClient API
  sl.registerLazySingleton<CreateItemApiClient>(() => CreateItemApiClient(httpClient: sl<http.Client>()));

  // Registering the CreateItemRepository
  sl.registerLazySingleton<CreateItemRepository>(() => CreateItemRepositoryImpl(apiClient: sl<CreateItemDemoClient>()));

  /* ******************  READ  ******************/

  // Registering the ReadItemDemoClient DEMO
  sl.registerLazySingleton<ReadItemDemoClient>(() => ReadItemDemoClient());

  // Registering the ReadItemApiClient
  sl.registerLazySingleton<ReadItemApiClient>(() => ReadItemApiClient(httpClient: sl<http.Client>()));

  // Registering the ReadItemRepository
  sl.registerLazySingleton<ReadItemRepository>(() => ReadItemRepositoryImpl(apiClient: sl<ReadItemDemoClient>()));

  /* *****************  UPDATE  *****************/

  // Registering the UpdateItemDemoClient DEMO
  sl.registerLazySingleton<UpdateItemDemoClient>(() => UpdateItemDemoClient());

  // Registering the UpdateItemApiClient API
  sl.registerLazySingleton<UpdateItemApiClient>(() => UpdateItemApiClient(httpClient: sl<http.Client>()));

  // Registering the UpdateItemRepository
  sl.registerLazySingleton<UpdateItemRepository>(() => UpdateItemRepositoryImpl(apiClient: sl<UpdateItemDemoClient>()));
}