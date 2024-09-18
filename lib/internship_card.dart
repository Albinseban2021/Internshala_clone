import 'package:flutter/material.dart';
import 'package:internshala_clone/Model/salary.dart';
import 'package:internshala_clone/view_detail.dart';

class InternshipCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String duration;
  final Stipend? stipend;
  final bool workFromHome;
  const InternshipCard({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    required this.duration,
    required this.stipend,
    required this.workFromHome,
  });
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
            workFromHome == false
                ? Row(
                    children: [
                      const Icon(Icons.location_pin, size: 15),
                      Text(location),
                    ],
                  )
                : const Row(
                    children: [
                      Icon(Icons.home, size: 15),
                      Text("Work from home"),
                    ],
                  ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.play_circle_outline_sharp, size: 15),
                const Text("Start Immediately"),
                const SizedBox(
                  width: 20,
                ),
                const Icon(Icons.calendar_today_outlined, size: 15),
                Text(duration),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.money_rounded, size: 15),
                Text(' ${stipend?.salary ?? 'null'}'),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Implement view details logic
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ViewDetails(
                          company: company,
                          duration: duration,
                          location: location,
                          stipend: stipend,
                          title: title,
                          workFromHome: workFromHome,
                        ),
                      ),
                    );
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