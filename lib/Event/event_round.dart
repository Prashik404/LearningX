import 'package:flutter/material.dart';

final GlobalKey<FormState> eventRoundKey = GlobalKey<FormState>();
final List<Widget> _cardTemplates = [];

class EventRoundForm extends StatefulWidget {
  const EventRoundForm({super.key});

  @override
  State<EventRoundForm> createState() => _EventRoundFormState();
}

class _EventRoundFormState extends State<EventRoundForm> {
  @override
  Widget build(BuildContext context) {
    return _buildEventRoundForm();
  }

  Widget _buildEventRoundForm() {
    return Form(
      key: eventRoundKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              children: [
                Column(children: _cardTemplates),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _cardTemplates.add(
                        _usingCardTemplate(_cardTemplates.length),
                      );
                    });
                  },
                  child: const Text('Add Round'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _usingCardTemplate(int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CardTemplate(
        index: index,
        onDelete: () {
          setState(() {
            if (_cardTemplates.length > 1) {
              _cardTemplates.removeAt(index);
            }
          });
        },
      ),
    );
  }
}

class CardTemplate extends StatelessWidget {
  const CardTemplate({super.key, required this.onDelete, required this.index});
  final VoidCallback onDelete;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Round ${index + 1}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(width: 200),
              if (index != 0)
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.cancel_sharp),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Round Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Start Date & Time',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(30, 30),
                            bottomLeft: Radius.elliptical(30, 30)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'End Date & Time',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.elliptical(30, 30),
                            bottomRight: Radius.elliptical(30, 30)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'About this round.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Duration (time in minutes)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Round Type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              items: ['Online', 'Offline']
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
          ),
          // const SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Elemination Round',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              items: ['Yes', 'No']
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
