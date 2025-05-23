import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wagus_web/routes/router.dart';
import 'package:wagus_web/strings/markdowns.dart';
import 'package:wagus_web/widgets/tokenomics_page.dart';

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
      backgroundColor: const Color(0xFF0D0D1F),
      body: Column(
        children: [
          _buildNavBar(context),
          if (selectedContent == null) _buildHeroSection(context),
          if (selectedContent != null) _buildContentSection(context),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 48,
            vertical: isMobile ? 12 : 16,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
          child:
              isMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildLogo(),
                          IconButton(
                            icon: Icon(Icons.menu, color: Colors.white),
                            onPressed: () {
                              // You can add drawer toggle or a modal menu here.
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildNavItems(isMobile),
                    ],
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [_buildLogo(), _buildNavItems(isMobile)],
                  ),
        );
      },
    );
  }

  Widget _buildLogo() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() => selectedContent = null),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/logo.png',
              height: 40,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Text(
              'WAGUS',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItems(bool isMobile) {
    final navItems = [
      _buildNavItem('Whitepaper', whitepaper),
      _buildNavItem('Tokenomics', tokenomics),
      _buildNavItem('Roadmap', roadmap),
    ];

    return isMobile
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...navItems.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: item,
              ),
            ),
            const SizedBox(height: 12),
            _buildBuyButton(),
          ],
        )
        : Row(
          children: [...navItems, const SizedBox(width: 16), _buildBuyButton()],
        );
  }

  Widget _buildNavItem(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => setState(() => selectedContent = value),
          child: Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBuyButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed:
          () => launchUrlString(
            'https://pump.fun/coin/7BMxgTQhTthoBcQizzFoLyhmSDscM56uMramXGMhpump',
          ),
      child: Text(
        'Buy \$WAGUS',
        style: GoogleFonts.inter(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.black, const Color(0xFF3A3A5A).withOpacity(0.9)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 32 : 120,
              vertical: 60,
            ),
            child: isSmallScreen ? _buildMobileHero() : _buildDesktopHero(),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopHero() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'The Future of Utility Tokens',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 56,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Empowering the Solana ecosystem with innovative tools and community-driven development.',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.8),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16,
                children: [
                  _buildActionButton(
                    'Try WAGUS APP',
                    Icons.phone_iphone,
                    'https://apps.apple.com/us/app/wagus/id6742799148',
                  ),
                  _buildActionButton(
                    'Join Community',
                    Icons.people,
                    'https://discord.gg/ypPzNgJNXC',
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 60),
        // Modified container with glitch effect
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Colors.white, Colors.white],
            ).createShader(bounds);
          },
          child: Stack(
            children: [
              Container(
                width: 500,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('assets/icons/red_logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Glitch overlay
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CustomPaint(painter: _GlitchPainter()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileHero() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The Future of Utility Tokens',
          style: GoogleFonts.spaceGrotesk(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Empowering the Solana ecosystem with innovative tools and community-driven development.',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.white.withOpacity(0.8),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: Column(
            children: [
              _buildActionButton(
                'Try WAGUS APP',
                Icons.phone_iphone,
                'https://apps.apple.com/us/app/wagus/id6742799148',
              ),
              const SizedBox(height: 16),
              _buildActionButton(
                'Join Community',
                Icons.people,
                'https://discord.gg/ypPzNgJNXC',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String text, IconData icon, String url) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 18),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6C4DF6),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () => launchUrlString(url),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 60),
        child:
            selectedContent == tokenomics
                ? const TokenomicsPage()
                : Markdown(
                  data: selectedContent!,
                  styleSheet: MarkdownStyleSheet(
                    h1: GoogleFonts.spaceGrotesk(
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    h2: GoogleFonts.spaceGrotesk(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    p: GoogleFonts.inter(
                      fontSize: 18,
                      height: 1.6,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    a: const TextStyle(color: Color(0xFF6C4DF6)),
                  ),
                ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 128,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(
                FontAwesomeIcons.xTwitter,
                'https://x.com/WAGUS_APP',
              ),
              const SizedBox(width: 10),
              _buildSocialIcon(
                FontAwesomeIcons.discord,
                'https://discord.gg/ypPzNgJNXC',
              ),
              const SizedBox(width: 10),
              _buildSocialIcon(
                FontAwesomeIcons.github,
                'https://github.com/WAGUS',
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => context.go(privacy),
            child: Text(
              'Privacy Policy',
              style: GoogleFonts.inter(color: Colors.white.withOpacity(0.7)),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '© 2025 WAGUS. All rights reserved',
            style: GoogleFonts.inter(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, size: 20),
      color: Colors.white.withOpacity(0.7),
      hoverColor: const Color(0xFF6C4DF6),
      onPressed: () => launchUrlString(url),
    );
  }
}

class _GlitchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(42); // Fixed seed for consistent glitch
    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0;

    // Horizontal glitch lines
    for (int i = 0; i < 15; i++) {
      final y = random.nextDouble() * size.height;
      final offset = random.nextDouble() * 20 - 10;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y + offset),
        paint..color = Colors.white.withOpacity(random.nextDouble() * 0.7),
      );
    }

    // Vertical glitch lines
    for (int i = 0; i < 10; i++) {
      final x = random.nextDouble() * size.width;
      final offset = random.nextDouble() * 20 - 10;
      canvas.drawLine(
        Offset(x, 0),
        Offset(x + offset, size.height),
        paint..color = Colors.white.withOpacity(random.nextDouble() * 0.5),
      );
    }

    // Random glitch blocks
    for (int i = 0; i < 8; i++) {
      final width = random.nextDouble() * 50 + 20;
      final height = random.nextDouble() * 30 + 10;
      canvas.drawRect(
        Rect.fromLTWH(
          random.nextDouble() * (size.width - width),
          random.nextDouble() * (size.height - height),
          width,
          height,
        ),
        paint
          ..style = PaintingStyle.fill
          ..color = Colors.white.withOpacity(random.nextDouble() * 0.3),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
