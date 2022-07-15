import '../network/api_services.dart';
import 'account_repo.dart';

class ApiRepository {
  static AccountRepo? _accountRepo;

  static final ApiServices _apiServices = ApiServices();

  static AccountRepo get accountRepo =>
      _accountRepo ??= AccountRepoImpl(_apiServices);
}