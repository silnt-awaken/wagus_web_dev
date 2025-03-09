import 'package:flutter/material.dart';
import 'constants.dart';
import 'widgets/countdown_timer.dart';
import 'widgets/banner_component.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.secondaryColor,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNavBar(),
            const BannerComponent(),
            _buildHeroSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('WAGUS', style: AppTextStyles.heading),
          Row(
            children: [
              _buildNavItem('Features'),
              _buildNavItem('Utility'),
              _buildNavItem('Tokenomics'),
              _buildNavItem('Roadmap'),
              ElevatedButton(
                style: AppButtonStyles.primaryButtonWhite,
                onPressed: () {},
                child: Text('Buy \$WAGUS', style: AppTextStyles.buttonTextBlack),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {},
        child: Text(text, style: AppTextStyles.navItem),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'WAGUS - AI Powered\nJob Agent',
                  style: AppTextStyles.heading,
                ),
                const SizedBox(height: 16),
                Text(
                  'The First DeepSeek AI-Powered Career Companion.',
                  style: AppTextStyles.subheading,
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    ElevatedButton(
                      style: AppButtonStyles.primaryButton,
                      onPressed: () {},
                      child: Text('Try WAGUS AI', style: AppTextStyles.buttonText),
                    ),
                    const SizedBox(width: 16),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text('Demo Video', style: AppTextStyles.buttonText),
                          const SizedBox(width: 8),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.textColor, width: 1),
                            ),
                            child: const Icon(Icons.play_arrow, color: AppColors.textColor, size: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          Column(
            children: [
              Container(
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Center(
                  child: Text(
                    'PRE-SALE STARTING SOON',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                child: CountdownTimer(
                  targetDate: DateTime.now().add(const Duration(days: 30)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
