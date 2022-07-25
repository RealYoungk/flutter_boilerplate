import 'package:go_router/go_router.dart';
import 'package:kick_admin/src/features/first/view/first_page.dart';
import 'package:kick_admin/src/features/home/view/home_page.dart';
import 'package:kick_admin/src/features/second/view/second_page.dart';

final GoRouter goRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/home',
      builder: (_, __) => const HomePage(),
    ),
    GoRoute(
      path: '/first',
      builder: (_, __) => const FirstPage(),
    ),
    GoRoute(
      path: '/second',
      builder: (_, __) => const SecondPage(),
    ),
  ],
);
