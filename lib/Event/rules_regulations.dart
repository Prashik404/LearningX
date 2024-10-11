import 'package:flutter/material.dart';

final GlobalKey<FormState> eventDetailsKey = GlobalKey<FormState>();
final List<Widget> _rulesFields = [];

class EventDetailsForm extends StatefulWidget {
  @override
  _EventDetailsFormState createState() => _EventDetailsFormState();
}

class _EventDetailsFormState extends State<EventDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: eventDetailsKey,
        child: ListView(
          children: [
            const SizedBox(height: 12),
            const Text(
              'Description',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 12),
            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                // labelText: 'Description',
                hintText:
                    'This field helps you to mention the details of the opportunity you are listing. '
                    'It is better to include rules, eligibility, process, format, etc. In order to get the opportunity approved. The more details, the better!',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Rules & Guidelines',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 110),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _rulesFields.add(_buildNewTextField());
                    });
                  },
                  icon: const Icon(Icons.add_circle),
                  alignment: const AlignmentDirectional(1, 1),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              children: _rulesFields,
            ),
            TextFormField(
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Add Rules & Guidelines',
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

  Widget _buildNewTextField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        maxLines: 2,
        decoration: const InputDecoration(
          labelText: 'Add Rules & Guidelines',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
