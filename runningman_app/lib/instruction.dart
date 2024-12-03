import 'package:flutter/material.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How to use this app'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome to the Running Man App!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'This app helps you explore Running Man episodes with:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              _buildFeatureSection(
                icon: Icons.map,
                title: 'Maps',
                description: 'Using naver map to locate every restaurant and location.',
              ),
              const SizedBox(height: 16),
              _buildFeatureSection(
                icon: Icons.tv,
                title: 'Episodes',
                description: 'Transcription and translation of the episode',
              ),
              const SizedBox(height: 16),
              _buildFeatureSection(
                icon: Icons.book,
                title: 'Dictionary',
                description: 'phrases/vocabs used in the episode',
              ),
              const SizedBox(height: 24),
              const Text(
                'Getting Started:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildInstructionStep(
                number: '1',
                text: 'Open the sidebar menu by tapping the menu icon in the top left',
              ),
              _buildInstructionStep(
                number: '2',
                text: 'Select an episode you want to explore',
              ),
              _buildInstructionStep(
                number: '3',
                text: 'Use the bottom navigation bar to switch between Maps, Episodes, and Dictionary views',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureSection({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInstructionStep({
    required String number,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}