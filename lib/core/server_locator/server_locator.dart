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
import 'package:todo_turno/features/user/application/use_cases/login_user_token.dart';
import 'package:todo_turno/features/user/application/use_cases/logout_user.dart';
import 'package:todo_turno/features/user/domain/repositories/auth_refresh_token_repository.dart';
import 'package:todo_turno/features/user/domain/repositories/register_user_repository.dart';
import 'package:todo_turno/features/user/infrastructure/data_providers/demo/auth_refresh_token_demo_client.dart';
import 'package:todo_turno/features/user/infrastructure/repositories/auth_refresh_token_repository_impl.dart';
import 'package:todo_turno/features/user/infrastructure/repositories/register_repository_impl.dart';
import '../../features/item/application/use_cases/read_item.dart';
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
import '../../features/shift/application/use_cases/create_shift.dart';
import '../../features/shift/domain/repositories/read_shifts_repository.dart';
import '../../features/shift/infrastructure/data_providers/api/read_shifts_api_client.dart';
import '../../features/shift/infrastructure/data_providers/demo/read_shifts_demo_client.dart';
import '../../features/shift/infrastructure/repositories/read_shifts_repository_impl.dart';
import '../../features/user/application/use_cases/register_user.dart';
import '../../features/user/domain/repositories/auth_user_repository.dart';
import '../../features/user/infrastructure/data_providers/api/auth_refresh_token_api_client.dart';
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

  // Registering the JwtTokenManager
  sl.registerLazySingleton<JwtTokenManager>(() => JwtTokenManager());

  /* ************************************************************************ */
  /* ********************************  User  ******************************** */
  /* ************************************************************************ */

  /* ****************  LOGIN USER  ****************/
  /* ******** USE CASE ******** */
  sl.registerLazySingleton<LoginUser>(() => LoginUser(sl<AuthUserRepository>(), sl<JwtTokenManager>()));


  // Registering the AuthUserDemoClient DEMO
  sl.registerLazySingleton<AuthUserDemoClient>(() => AuthUserDemoClient());

  // Registering the AuthUserApiClient API
  sl.registerLazySingleton<AuthUserApiClient>(() => AuthUserApiClient());

  // Registering the AuthUserRepository
  sl.registerLazySingleton<AuthUserRepository>(() => AuthUserRepositoryImpl(apiClient: sl<AuthUserDemoClient>()));

  /* ************  LOGIN REFRESH TOKEN  ************/
  /* ******** USE CASE ******** */
  sl.registerLazySingleton<LoginUserToken>(() => LoginUserToken(sl<AuthRefreshTokenRepository>(), sl<JwtTokenManager>()));

  // Registering the AuthRefreshTokenDemoClient DEMO
  sl.registerLazySingleton<AuthRefreshTokenDemoClient>(() => AuthRefreshTokenDemoClient());

  // Registering the AuthRefreshTokenApiClient API
  sl.registerLazySingleton<AuthRefreshTokenApiClient>(() => AuthRefreshTokenApiClient());

  // Registering the AuthRefreshTokenRepository
  sl.registerLazySingleton<AuthRefreshTokenRepository>(() => AuthRefreshTokenRepositoryImpl(apiClient: sl<AuthRefreshTokenDemoClient>()));

  /* ***************  LOGOUT USER  ***************/
  /* ******** USE CASE ******** */
  sl.registerLazySingleton<LogoutUser>(() => LogoutUser(sl<JwtTokenManager>()));

  /* *****************  REGISTER  *****************/
  /* ******** USE CASE ******** */
  sl.registerLazySingleton<RegisterUser>(() => RegisterUser(sl<RegisterUserRepository>()));

  // Registering the RegisterUserDemoClient DEMO
  sl.registerLazySingleton<RegisterDemoClient>(() => RegisterDemoClient());

  // Registering the RegisterUserApiClient API
  sl.registerLazySingleton<RegisterUserApiClient>(() => RegisterUserApiClient());

  // Registering the RegisterUserRepository
  sl.registerLazySingleton<RegisterUserRepository>(() => RegisterUserRepositoryImpl(apiClient: sl<RegisterUserApiClient>()));

  /* ************************************************************************ */
  /* ********************************  Item  ******************************** */
  /* ************************************************************************ */

  /* *****************  CREATE  *****************/

  // Registering the CreateItemDemoClient DEMO
  sl.registerLazySingleton<CreateItemDemoClient>(() => CreateItemDemoClient());

  // Registering the CreateApiDemoClient API
  sl.registerLazySingleton<CreateItemApiClient>(() => CreateItemApiClient());

  // Registering the CreateItemRepository
  sl.registerLazySingleton<CreateItemRepository>(() => CreateItemRepositoryImpl(apiClient: sl<CreateItemDemoClient>()));

  /* ******************  READ  ******************/
  /* ******** USE CASE ******** */
  sl.registerLazySingleton<ReadItem>(() => ReadItem(sl<ReadItemRepository>()));

  // Registering the ReadItemDemoClient DEMO
  sl.registerLazySingleton<ReadItemDemoClient>(() => ReadItemDemoClient());

  // Registering the ReadItemApiClient
  sl.registerLazySingleton<ReadItemApiClient>(() => ReadItemApiClient());

  // Registering the ReadItemRepository
  sl.registerLazySingleton<ReadItemRepository>(() => ReadItemRepositoryImpl(apiClient: sl<ReadItemDemoClient>()));

  /* *****************  UPDATE  *****************/

  // Registering the UpdateItemDemoClient DEMO
  sl.registerLazySingleton<UpdateItemDemoClient>(() => UpdateItemDemoClient());

  // Registering the UpdateItemApiClient API
  sl.registerLazySingleton<UpdateItemApiClient>(() => UpdateItemApiClient());

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
  /* ******** USE CASE ******** */
  sl.registerLazySingleton<CreateShift>(() => CreateShift(sl<CreateShiftRepository>()));

  // Registering the CreateShiftDemoClient DEMO
  sl.registerLazySingleton<CreateShiftDemoClient>(() => CreateShiftDemoClient());

  // Registering the CreateShiftApiClient API
  sl.registerLazySingleton<CreateShiftApiClient>(() => CreateShiftApiClient());

  // Registering the CreateShiftRepository
  sl.registerLazySingleton<CreateShiftRepository>(() => CreateShiftRepositoryImpl(apiClient: sl<CreateShiftDemoClient>()));

  /* ******************  READ  ******************/

  // Registering the ReadShiftDemoClient DEMO
  sl.registerLazySingleton<ReadShiftsDemoClient>(() => ReadShiftsDemoClient());

  // Registering the ReadShiftsApiClient API
  sl.registerLazySingleton<ReadShiftsApiClient>(() => ReadShiftsApiClient());

  // Registering the ReadShiftsRepository
  sl.registerLazySingleton<ReadShiftsRepository>(() => ReadShiftsRepositoryImpl(apiClient: sl<ReadShiftsDemoClient>()));
}