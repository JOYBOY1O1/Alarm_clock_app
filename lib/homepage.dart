import 'package:alarm_clock/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String formattedTime;
  late String formattedDate;
  late String timezoneString;
  late String offsetSign;

  @override
  void initState() {
    super.initState();
    updateTimeAndDate();
  }

  void updateTimeAndDate() {
    var now = DateTime.now();
    formattedTime = DateFormat('HH:mm').format(now);
    formattedDate = DateFormat('EEE, d MMM').format(now);

    timezoneString = now.timeZoneOffset.toString().split('.').first;
    offsetSign = timezoneString.startsWith('-') ? '+' : '';
  }

  @override
  Widget build(BuildContext context) {
    // Recalculate the date and time every time the build method is called.
    // This ensures the time and date displayed are always up to date.
    updateTimeAndDate();

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              TextButton(
                onPressed: () {},
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlutterLogo(),
                    Text(
                      'Clock',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(32),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Clock',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  formattedTime, // Use formattedTime here if needed
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                  ),
                ),
                Text(
                  formattedDate, // Use formattedDate here
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const ClockView(),
                const Text(
                  'Timezone',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    const SizedBox(
                        width: 16), // Changed height to width for row alignment
                    Text(
                      'UTC $offsetSign $timezoneString',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}