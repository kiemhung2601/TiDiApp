import '../network/api_services.dart';
import 'account_repo.dart';
import 'contact_repo.dart';

class ApiRepository {
  static AccountRepo? _accountRepo;
  static ContactRepo? _contactRepo;

  static final ApiServices _apiServices = ApiServices();

  static AccountRepo get accountRepo =>
      _accountRepo ??= AccountRepoImpl(_apiServices);
  static ContactRepo get contactRepo =>
      _contactRepo ??= ContactRepoImpl(_apiServices);
}