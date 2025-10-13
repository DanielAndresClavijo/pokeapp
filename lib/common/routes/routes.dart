// GoRouter configuration
import 'package:go_router/go_router.dart';
import 'package:pokeapp/presentation/splash/splash_page.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
  ],
);
