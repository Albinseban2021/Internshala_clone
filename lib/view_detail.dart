import 'package:flutter/material.dart';
import 'package:internshala_clone/Model/salary.dart';

class ViewDetails extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String duration;
  final Stipend? stipend;
  final bool workFromHome;

  const ViewDetails({
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
    return Scaffold(
      appBar: AppBar(title: const Text('View Detail')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  company,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 15),
                workFromHome == false
                    ? Row(
                        children: [
                          const Icon(Icons.location_pin),
                          Text(
                            location,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    : const Row(
                        children: [
                          Icon(Icons.home),
                          Text(
                            "Work from home",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(Icons.play_circle_outline_sharp),
                    const Text(
                      "Start Immediately",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(Icons.calendar_today_outlined),
                    Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(Icons.money_rounded),
                    Text(
                      ' ${stipend?.salary ?? 'null'}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
