import 'package:go_router/go_router.dart';
import 'package:wagus_web/sections/landing_page/landing_page.dart';
import 'package:wagus_web/sections/privacy_page.dart';

const home = '/';
const privacy = '/privacy';

final router = GoRouter(
  routes: [
    GoRoute(path: home, builder: (context, state) => LandingPage()),
    GoRoute(path: privacy, builder: (context, state) => PrivacyPage()),
  ],
);
