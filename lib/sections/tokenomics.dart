import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:wagus_web/strings/markdowns.dart';

class TokenomicsScreen extends StatelessWidget {
  const TokenomicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text("Tokenomics"), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Markdown(
            data: tokenomics,
            styleSheet: MarkdownStyleSheet(
              h1: Theme.of(context).textTheme.displayLarge,
              tableBody: Theme.of(context).textTheme.bodyLarge,
              code: TextStyle(
                backgroundColor: Colors.white,
                fontFamily: 'SF-Mono',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
