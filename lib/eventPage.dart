import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  EventPageState createState() => EventPageState();
}

class EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.white,
              onPressed: () {},
            );
          },
        ),
        title: const Text(
          'Event Details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 15, 108, 224),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                Expanded(
                  flex: 0,
                  child: Image.network('https://picsum.photos/seed/300/300'),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // padding:
                      //     const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('Add Image'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // Text field for name input
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Event Title',
                hintText: 'Enter Event title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Festival Name',
                hintText: 'Enter Festival Name (optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Radio buttons for options
            const Text(
              'Event Type :',
              style: TextStyle(fontSize: 18),
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: RadioListTile(
            //         title: const Text('Contest Event'),
            //         value: 'Option 1',
            //         groupValue: () {},
            //         onChanged: (value) {},
            //       ),
            //     ),
            //     Expanded(
            //       child: RadioListTile(
            //         title: const Text('Non - Contest Event'),
            //         value: 'Option 2',
            //         groupValue: () {},
            //         onChanged: (value) {},
            //       ),
            //     ),
            //   ],
            // ),
            Column(
              children: [
                RadioListTile(
                  title: const Text('Contest Event'),
                  value: 'Option 1',
                  groupValue: () {},
                  onChanged: (value) {},
                ),
                RadioListTile(
                  title: const Text('Non - Contest Event'),
                  value: 'Option 2',
                  groupValue: () {},
                  onChanged: (value) {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Event Date & Location Details :',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Start Date and Time', // Label for the field
                    suffixIcon: const Icon(
                        Icons.calendar_month_outlined), // Icon on the right
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded border
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'End Date and Time', // Label for the field
                    suffixIcon: const Icon(
                        Icons.calendar_month_outlined), // Icon on the right
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded border
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                      title: const Text('Offline'),
                      value: 'Option 1',
                      groupValue: () {},
                      onChanged: (value) {}),
                ),
                Expanded(
                  child: RadioListTile(
                      title: const Text('Online'),
                      value: 'Option 1',
                      groupValue: () {},
                      onChanged: (value) {}),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'City',
                hintText: 'Enter City',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Venue',
                hintText: 'Enter Venue',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
            const SizedBox(height: 20),

            // Submit button
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Save & Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
