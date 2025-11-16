part of 'main.dart';

class Service {
  static Future<void> initFlutter() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  static Future<void> initEnv() async {
    await dotenv.load(fileName: '.env');
  }

  static ProviderContainer registerServices() {
    final container = ProviderContainer();
    final apiService = GetIt.I.registerSingleton(ApiService());
    final secureStorageSerivce = GetIt.I.registerSingleton(
      SecureStorageService()..init(),
    );
    GetIt.I.registerSingleton(
      AuthService(
        api: apiService,
        secureStorageService: secureStorageSerivce,
        container: container,
      ),
    );
    GetIt.I.registerSingleton(ScreenCaptureService());

    GetIt.I.registerSingleton(RouterService()..init());
    return container;
  }

  static Future<void> initAsyncServices() async {
    final summaryCacheService = GetIt.I.registerSingleton(SummaryCacheService());
    await summaryCacheService.init();
  }
}
