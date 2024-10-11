import 'package:flutter/material.dart';

final GlobalKey<FormState> prizeKey = GlobalKey<FormState>();

class PrizeCardTemplate extends StatelessWidget {
  const PrizeCardTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Will a participation certificate be provided?',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                // labelText: 'Round Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              hint: const Text('YES / NO'),
              items: ['Yes', 'No']
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Total rewards',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Rank',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Prize Money',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Additional information',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildprizeForm() {
  return Form(
    key: prizeKey,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          Column(
            children: [
              PrizeCardTemplate(),
            ],
          ),
        ],
      ),
    ),
  );
}
