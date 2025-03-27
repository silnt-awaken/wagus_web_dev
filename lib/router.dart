import 'package:go_router/go_router.dart';
import 'package:wagus_web/main.dart';
import 'package:wagus_web/privacy_page.dart';

const home = '/';
const privacy = '/privacy';

final router = GoRouter(routes: [
  GoRoute(
    path: home,
    builder: (context, state) => LandingPage(),
  ),
  GoRoute(path: privacy, builder: (context, state) => PrivacyPage()),
]);
