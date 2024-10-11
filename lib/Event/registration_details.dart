import 'package:flutter/material.dart';

final GlobalKey<FormState> registrationDetailsKey = GlobalKey<FormState>();

Widget buildRegistrationDetailsForm() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Form(
      key: registrationDetailsKey,
      child: ListView(
        children: [
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Participation Type',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
            items: ['Individual', 'Team']
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Team Size Min',
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
                    labelText: 'Team Size Max',
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
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Registration Start Date',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Enter Event Start Date',
              suffixIcon: Icon(Icons.calendar_month_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Registration End Date',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Enter Event End Date',
              suffixIcon: Icon(Icons.calendar_month_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Row(
          //   children: [
          //     Expanded(
          //       child: TextFormField(
          //         decoration:
          //             const InputDecoration(labelText: 'Team Size Min'),
          //         keyboardType: TextInputType.number,
          //       ),
          //     ),
          //     const SizedBox(width: 16),
          //     Expanded(
          //       child: TextFormField(
          //         decoration:
          //             const InputDecoration(labelText: 'Team Size Max'),
          //         keyboardType: TextInputType.number,
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 16),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     labelText: 'Registration Start Date & Time',
          //     suffixIcon: Icon(Icons.calendar_today),
          //   ),
          //   readOnly: true,
          //   onTap: () {
          //     // DatePicker Logic
          //   },
          // ),
          // const SizedBox(height: 16),
          // TextFormField(
          //   decoration: const InputDecoration(
          //     labelText: 'Registration End Date & Time',
          //     suffixIcon: Icon(Icons.calendar_today),
          //   ),
          //   readOnly: true,
          //   onTap: () {
          //     // DatePicker Logic
          //   },
          // ),
        ],
      ),
    ),
  );
}
