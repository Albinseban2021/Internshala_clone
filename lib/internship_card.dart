import 'package:flutter/material.dart';

class InternshipCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String duration;
  final String stipend;

  const InternshipCard({
    Key? key,
    required this.title,
    required this.company,
    required this.location,
    required this.duration,
    required this.stipend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(company),
            const SizedBox(height: 8.0),
            Text(location),
            const SizedBox(height: 8.0),
            Text(duration),
            const SizedBox(height: 8.0),
            Text(stipend),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Implement view details logic
                  },
                  child: const Text('View details'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement apply now logic
                  },
                  child: const Text('Apply now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}