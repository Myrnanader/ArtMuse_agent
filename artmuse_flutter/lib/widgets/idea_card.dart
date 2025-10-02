
import 'package:flutter/material.dart';

class IdeaCard extends StatelessWidget {
  final String idea;

  const IdeaCard({Key? key, required this.idea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final lines = idea.trim().split(RegExp(r'\n+')).where((line) => line.trim().isNotEmpty).toList();

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.deepPurple.shade50,
      child: Container(
        constraints: BoxConstraints(maxHeight: 300),
        padding: const EdgeInsets.all(16),
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: lines.map((line) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  "• $line",
                  style: TextStyle(fontSize: 16, color: Colors.deepPurple.shade900),
                ),
              )).toList(),
            ),
          ),
        ),
      ),
    );
  }
}