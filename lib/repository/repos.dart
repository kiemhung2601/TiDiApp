import '../network/api_services.dart';
import 'account_repo.dart';
import 'contact_repo.dart';
import 'history_repo.dart';
import 'news_repo.dart';
import 'notification_repo.dart';

class ApiRepository {
  static AccountRepo? _accountRepo;
  static ContactRepo? _contactRepo;
  static NewsRepo? _newsRepo;
  static HistoryRepo? _historyRepo;
  static NotificationRepo? _notificationRepo;

  static final ApiServices _apiServices = ApiServices();

  static AccountRepo get accountRepo =>
      _accountRepo ??= AccountRepoImpl(_apiServices);
  static ContactRepo get contactRepo =>
      _contactRepo ??= ContactRepoImpl(_apiServices);
  static NewsRepo get newsRepo =>
      _newsRepo ??= NewsRepoImpl(_apiServices);
  static HistoryRepo get historyRepo =>
      _historyRepo ??= HistoryRepoImpl(_apiServices);
  static NotificationRepo get notificationRepo =>
      _notificationRepo ??= NotificationRepoImpl(_apiServices);
}