import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:wagus_web/privacy.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Markdown(
          data: wagusPrivacyPolicy,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            p: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
            h1: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white),
            h2: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
