import '../../screens/screens.dart';
import 'app_route_names.dart';

class AppNavigation {
  final routes = {
    AppRouteNames.auth: (_) => const AuthScreen(),
    AppRouteNames.main: (_) => const MainScreen(),
  };
}
