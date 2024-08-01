import 'package:get_it/get_it.dart';
import 'package:todo_turno/core/network/jwt_token_manager.dart';
import 'package:todo_turno/features/item/domain/repositories/delete_item_repository.dart';
import 'package:todo_turno/features/item/infrastructure/data_providers/api/delete_item_api_client.dart';
import 'package:todo_turno/features/item/infrastructure/data_providers/demo/delete_item_demo_client.dart';
import 'package:todo_turno/features/item/infrastructure/data_providers/api/read_item_api_client.dart';
import 'package:todo_turno/features/item/infrastructure/data_providers/api/update_item_api_client.dart';
import 'package:todo_turno/features/item/infrastructure/repositories/delete_item_repository_impl.dart';
import 'package:todo_turno/features/shift/domain/repositories/create_shift_repository.dart';
import 'package:todo_turno/features/shift/infrastructure/data_providers/api/create_shift_api_client.dart';
import 'package:todo_turno/features/shift/infrastructure/data_providers/demo/create_shift_demo_client.dart';
import 'package:todo_turno/features/shift/infrastructure/repositories/create_shift_repository_impl.dart';
import 'package:todo_turno/features/user/application/use_cases/login_user.dart';
import 'package:todo_turno/features/user/application/view_models/auth_view_model.dart';
import 'package:todo_turno/features/user/domain/repositories/register_user_repository.dart';
import 'package:todo_turno/features/user/infrastructure/repositories/register_repository_impl.dart';
import '../../features/item/domain/repositories/create_item_repository.dart';
import '../../features/item/domain/repositories/read_item_repository.dart';
import '../../features/item/domain/repositories/update_item_repository.dart';
import '../../features/item/infrastructure/data_providers/api/create_item_api_client.dart';
import '../../features/item/infrastructure/data_providers/demo/create_item_demo_client.dart';
import '../../features/item/infrastructure/data_providers/demo/read_item_demo_client.dart';
import '../../features/item/infrastructure/data_providers/demo/update_item_demo_client.dart';
import '../../features/item/infrastructure/repositories/create_item_repository_impl.dart';
import '../../features/item/infrastructure/repositories/read_item_repository_impl.dart';
import '../../features/item/infrastructure/repositories/update_item_repository_impl.dart';
import '../../features/shift/domain/repositories/read_shifts_repository.dart';
import '../../features/shift/infrastructure/data_providers/api/read_shifts_api_client.dart';
import '../../features/shift/infrastructure/data_providers/demo/read_shifts_demo_client.dart';
import '../../features/shift/infrastructure/repositories/read_shifts_repository_impl.dart';
import '../../features/user/domain/repositories/auth_user_repository.dart';
import '../../features/user/infrastructure/data_providers/api/auth_user_api_client.dart';
import '../../features/user/infrastructure/data_providers/api/register_user_api_client.dart';
import '../../features/user/infrastructure/data_providers/demo/auth_user_demo_client.dart';
import '../../features/user/infrastructure/data_providers/demo/register_user_demo_client.dart';
import '../../features/user/infrastructure/repositories/auth_repository_impl.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

void setupServiceLocator() {

  // Registering the httpClient
  sl.registerLazySingleton<http.Client>(() => http.Client());

  /* ************************************************************************ */
  /* ********************************  User  ******************************** */
  /* ************************************************************************ */

  /* *****************  REGISTER  *****************/

  // Registering the AuthUserDemoClient DEMO
  sl.registerLazySingleton<AuthUserDemoClient>(() => AuthUserDemoClient());

  // Registering the AuthUserApiClient API
  sl.registerLazySingleton<AuthUserApiClient>(() => AuthUserApiClient(httpClient: sl<http.Client>()));

  // Registering the AuthUserRepository
  sl.registerLazySingleton<AuthUserRepository>(() => AuthRepositoryImpl(apiClient: sl<AuthUserDemoClient>()));

  // Registering the AuthUserViewModel
  sl.registerLazySingleton<AuthViewModel>(() => AuthViewModel(loginUser: sl<LoginUser>(), jwtTokenManager: sl<JwtTokenManager>()));

  /* *****************  LOGIN  *****************/

  // Registering the RegisterUserDemoClient DEMO
  sl.registerLazySingleton<RegisterDemoClient>(() => RegisterDemoClient());

  // Registering the RegisterUserApiClient API
  sl.registerLazySingleton<RegisterUserApiClient>(() => RegisterUserApiClient(httpClient: sl<http.Client>()));

  // Registering the RegisterUserRepository
  sl.registerLazySingleton<RegisterUserRepository>(() => RegisterUserRepositoryImpl(apiClient: sl<RegisterDemoClient>()));

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

  /* *****************  DELETE  *****************/

  // Registering the DeleteItemDemoClient DEMO
  sl.registerLazySingleton<DeleteItemDemoClient>(() => DeleteItemDemoClient());

  // Registering the DeleteItemApiClient API
  sl.registerLazySingleton<DeleteItemApiClient>(() => DeleteItemApiClient(httpClient: sl<http.Client>()));

  // Registering the DeleteItemRepository
  sl.registerLazySingleton<DeleteItemRepository>(() => DeleteItemRepositoryImpl(apiClient: sl<DeleteItemDemoClient>()));

  /* ************************************************************************ */
  /* ********************************  Shift  ******************************* */
  /* ************************************************************************ */

  /* *****************  CREATE  *****************/

  // Registering the CreateShiftDemoClient DEMO
  sl.registerLazySingleton<CreateShiftDemoClient>(() => CreateShiftDemoClient());

  // Registering the CreateShiftApiClient API
  sl.registerLazySingleton<CreateShiftApiClient>(() => CreateShiftApiClient(httpClient: sl<http.Client>()));

  // Registering the CreateShiftRepository
  sl.registerLazySingleton<CreateShiftRepository>(() => CreateShiftRepositoryImpl(apiClient: sl<CreateShiftDemoClient>()));

  /* ******************  READ  ******************/

  // Registering the ReadShiftDemoClient DEMO
  sl.registerLazySingleton<ReadShiftsDemoClient>(() => ReadShiftsDemoClient());

  // Registering the ReadShiftsApiClient API
  sl.registerLazySingleton<ReadShiftsApiClient>(() => ReadShiftsApiClient(httpClient: sl<http.Client>()));

  // Registering the ReadShiftsRepository
  sl.registerLazySingleton<ReadShiftsRepository>(() => ReadShiftsRepositoryImpl(apiClient: sl<ReadShiftsDemoClient>()));
}