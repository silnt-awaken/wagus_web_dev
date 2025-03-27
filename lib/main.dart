import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wagus_web/markdowns.dart';
import 'package:wagus_web/router.dart';
import 'package:wagus_web/widgets/tokenomics_page.dart';
import 'constants.dart';
import 'widgets/countdown_timer.dart';
import 'widgets/banner_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  await GetStorage.init();
  usePathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.secondaryColor,
      ),
      routerConfig: router,
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String? selectedContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildNavBar(context),
          const BannerComponent(),
          Expanded(
            child: selectedContent != null
                ? (selectedContent == tokenomics
                    ? const TokenomicsPage() // Render custom page
                    : Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Markdown(
                          data: selectedContent!,
                          styleSheet:
                              MarkdownStyleSheet.fromTheme(Theme.of(context))
                                  .copyWith(
                            tableBody: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.white, fontSize: 16),
                            p: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.white, fontSize: 16),
                            h1: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white, fontSize: 22),
                            h2: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white, fontSize: 20),
                            h3: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.white, fontSize: 18),
                            h4: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: Colors.white, fontSize: 16),
                            h5: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ))
                : _buildHeroSection(context),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedContent = null;
                      });
                    },
                    child: Text('WAGUS', style: AppTextStyles.heading)),
                const SizedBox(width: 16),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/icons/logo.png'),
                )
              ],
            ),
          ),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            alignment: WrapAlignment.end,
            children: [
              _buildNavItem('Whitepaper', whitepaper),
              _buildNavItem('Tokenomics', tokenomics),
              _buildNavItem('Roadmap', roadmap),
              ElevatedButton(
                style: AppButtonStyles.primaryButtonWhite,
                onPressed: () async =>
                    launchUrlString('https://pump.fun/board'),
                child:
                    Text('Buy \$WAGUS', style: AppTextStyles.buttonTextBlack),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, String content) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedContent = content;
        });
      },
      child: Text(label, style: AppTextStyles.navItem),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 800;

    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 64),
            child: isSmallScreen
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLeftColumn(),
                      const SizedBox(height: 32),
                      _buildRightColumn(screenWidth),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: _buildLeftColumn()),
                      const SizedBox(width: 48),
                      _buildRightColumn(screenWidth),
                    ],
                  ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: AppColors.primaryColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.xTwitter,
                        color: Colors.white),
                    onPressed: () async =>
                        launchUrlString('https://x.com/WAGUS_APP'),
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.discord,
                        color: Colors.white),
                    onPressed: () async =>
                        launchUrlString('https://discord.gg/ypPzNgJNXC'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async => context.go(privacy),
                    child: const Text(
                      'Privacy Policy',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '© WAGUS 2025 - All rights reserved',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('WAGUS - The Future of Utility Tokens',
            style: AppTextStyles.heading),
        const SizedBox(height: 16),
        Text(
          'WAGUS aims to empower individuals and organizations by providing innovative tools and resources to drive success in the digital economy. Our mission is to bridge the gap between technology and accessibility, fostering growth and collaboration through cutting-edge solutions.',
          style: AppTextStyles.subheading,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 16,
          children: [
            ElevatedButton(
              style: AppButtonStyles.primaryButton,
              onPressed: () async => launchUrlString(
                  'https://apps.apple.com/us/app/youtube/id544007664'),
              child: Text('Try WAGUS APP', style: AppTextStyles.buttonText),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRightColumn(double screenWidth) {
    final timerWidth = screenWidth > 1000 ? 400.0 : screenWidth * 0.4;

    return Column(
      children: [
        Container(
          width: timerWidth,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Center(
            child: Text(
              'Launch begins in',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          width: timerWidth,
          child: CountdownTimer(),
        ),
      ],
    );
  }
}
