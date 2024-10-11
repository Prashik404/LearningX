import 'package:flutter/material.dart';
import 'package:learningx/Event/basic_details.dart';
import 'Event/registration_details.dart';
import 'Event/rules_regulations.dart';
import 'Event/event_round.dart';
import 'Event/rewards_recognition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Creation Form',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CreateEventForm(),
    );
  }
}

class CreateEventForm extends StatefulWidget {
  const CreateEventForm({super.key});

  @override
  _CreateEventFormState createState() => _CreateEventFormState();
}

class _CreateEventFormState extends State<CreateEventForm> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentStep = 0;

  // Form keys for validation
  final basicDetailsKey = GlobalKey<FormState>();
  final registrationDetailsKey = GlobalKey<FormState>();
  final eventDetailsKey = GlobalKey<FormState>();
  final eventRoundKey = GlobalKey<FormState>();
  final prizeKey = GlobalKey<FormState>();
  // final List<Widget> _rulesFields = [];
  // final List<Widget> _cardTemplates = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Event',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 108, 224),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            if (_currentStep > 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
              setState(() {
                _currentStep--;
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Column(
        children: [
          // Custom Step Indicator
          _buildStepIndicator(),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(), // Prevent swiping
              children: [
                buildBasicDetailsForm(),
                buildRegistrationDetailsForm(),
                EventDetailsForm(),
                const EventRoundForm(),
                buildprizeForm()
              ],
            ),
          ),
          // Navigation Buttons
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    List<String> steps = [
      ' Basic Details',
      ' Registration Details',
      ' Rules & Regulations',
      ' Event Rounds',
      ' Rewards & Recognition'
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(steps.length, (index) {
            return Column(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor:
                      _currentStep == index ? Colors.blue : Colors.grey[300],
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      color:
                          _currentStep == index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  steps[index],
                  style: TextStyle(
                    color: _currentStep == index ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_currentStep > 0)
            ElevatedButton(
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                setState(() {
                  _currentStep--;
                });
              },
              child: const Text('Back'),
            ),
          ElevatedButton(
            onPressed: () {
              if (_currentStep < 4) {
                // Move to the next step
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                setState(() {
                  _currentStep++;
                });
              } else {
                // Submit Form
                if (basicDetailsKey.currentState!.validate() &&
                    registrationDetailsKey.currentState!.validate() &&
                    eventDetailsKey.currentState!.validate() &&
                    eventRoundKey.currentState!.validate() &&
                    prizeKey.currentState!.validate()) {
                  // Submit data to backend
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Event Created Successfully!')),
                  );
                }
              }
            },
            child: Text(_currentStep == 4 ? 'Submit' : 'Next'),
          ),
        ],
      ),
    );
  }
}
