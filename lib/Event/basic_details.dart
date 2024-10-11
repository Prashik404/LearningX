import 'package:flutter/material.dart';

final GlobalKey<FormState> basicDetailsKey = GlobalKey<FormState>();

Widget buildBasicDetailsForm() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Form(
      key: basicDetailsKey,
      child: ListView(
        children: [
          const Text(
            'Basic Details',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Event Name',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Enter Event Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Event Type',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 12,
          ),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Select Event Type',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
            items: ['Contest Event', 'Non-Contest Event']
                .map((label) => DropdownMenuItem(
                      value: label,
                      child: Text(label),
                    ))
                .toList(),
            onChanged: (value) {},
          ),
          const SizedBox(height: 12),
          const Text(
            'Event Description',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Enter Event Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Event Date',
                    suffixIcon: Icon(Icons.calendar_month_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    // Select Date Logic
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Event Time',
                    suffixIcon: Icon(Icons.watch_later_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    // Select Time Logic
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
