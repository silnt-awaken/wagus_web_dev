import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:wagus_web/markdowns.dart';
import 'package:wagus_web/widgets/tokenomics_pie_cart.dart';
import '../constants.dart'; // adjust import based on your structure

class TokenomicsPage extends StatelessWidget {
  const TokenomicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tokenomics', style: AppTextStyles.heading),
          const SizedBox(height: 24),
          Center(
              child: SizedBox(
                  height: 250, width: 500, child: TokenomicsPieChart())),
          const SizedBox(height: 32),
          MarkdownBody(
            data: tokenomics,
            styleSheet:
                MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
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
        ],
      ),
    );
  }
}
