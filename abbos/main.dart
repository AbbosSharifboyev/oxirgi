import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  tz.initializeTimeZones();
  runApp(const TimeZoneApp());
}

class TimeZoneApp extends StatelessWidget {
  const TimeZoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real-Time Time Zones',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro', // Apple-like font
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const TimeZoneTable(),
    );
  }
}

class TimeZoneTable extends StatefulWidget {
  const TimeZoneTable({Key? key}) : super(key: key);

  @override
  State<TimeZoneTable> createState() => _TimeZoneTableState();
}

class _TimeZoneTableState extends State<TimeZoneTable> {
  final Map<String, String> timeZones = {
    'New York (EST)': 'America/New_York',
  'London (GMT)': 'Europe/London',
  'Tashkent (UZT)': 'Asia/Tashkent',
  'Tokyo (JST)': 'Asia/Tokyo',
  'Paris (CET)': 'Europe/Paris',
  'Sydney (AEDT)': 'Australia/Sydney',
  'Los Angeles (PST)': 'America/Los_Angeles',
  'Moscow (MSK)': 'Europe/Moscow',
  'Delhi (IST)': 'Asia/Kolkata',
  'Dubai (GST)': 'Asia/Dubai',
  'Singapore (SGT)': 'Asia/Singapore',
  'Bangkok (ICT)': 'Asia/Bangkok',
  'Buenos Aires (ART)': 'America/Argentina/Buenos_Aires',
  'Cairo (EET)': 'Africa/Cairo',
  'Cape Town (SAST)': 'Africa/Johannesburg',
  'Chicago (CST)': 'America/Chicago',
  'Hong Kong (HKT)': 'Asia/Hong_Kong',
  'Istanbul (TRT)': 'Europe/Istanbul',
  'Jakarta (WIB)': 'Asia/Jakarta',
  'Kuala Lumpur (MYT)': 'Asia/Kuala_Lumpur',
  'Lagos (WAT)': 'Africa/Lagos',
  'Mexico City (CST)': 'America/Mexico_City',
  'Montreal (EST)': 'America/Montreal',
  'Nairobi (EAT)': 'Africa/Nairobi',
  'Riyadh (AST)': 'Asia/Riyadh',
  'Rome (CET)': 'Europe/Rome',
  'San Francisco (PST)': 'America/Los_Angeles',
  'Santiago (CLT)': 'America/Santiago',
  'Seoul (KST)': 'Asia/Seoul',
  'Shanghai (CST)': 'Asia/Shanghai',
  'Stockholm (CET)': 'Europe/Stockholm',
  'Toronto (EST)': 'America/Toronto',
  'Vancouver (PST)': 'America/Vancouver',
  'Warsaw (CET)': 'Europe/Warsaw',
  'Zürich (CET)': 'Europe/Zurich',
  'Athens (EET)': 'Europe/Athens',
  'Baghdad (AST)': 'Asia/Baghdad',
  'Beirut (EET)': 'Asia/Beirut',
  'Bogotá (COT)': 'America/Bogota',
  'Brisbane (AEST)': 'Australia/Brisbane',
  'Casablanca (WET)': 'Africa/Casablanca',
  'Doha (AST)': 'Asia/Qatar',
  'Edmonton (MST)': 'America/Edmonton',
  'Hanoi (ICT)': 'Asia/Ho_Chi_Minh',
  'Helsinki (EET)': 'Europe/Helsinki',
  'Karachi (PKT)': 'Asia/Karachi',
  'Kingston (EST)': 'America/Jamaica',
  'Lima (PET)': 'America/Lima',
  'Lisbon (WET)': 'Europe/Lisbon',
  'Manila (PST)': 'Asia/Manila',
  'Melbourne (AEDT)': 'Australia/Melbourne',
  'Minsk (MSK)': 'Europe/Minsk',
  'Monterrey (CST)': 'America/Monterrey',
  'Oslo (CET)': 'Europe/Oslo',
  'Panama City (EST)': 'America/Panama',
  'Perth (AWST)': 'Australia/Perth',
  'Prague (CET)': 'Europe/Prague',
  'Quito (ECT)': 'America/Guayaquil',
  'Reykjavik (GMT)': 'Atlantic/Reykjavik',
  'Salt Lake City (MST)': 'America/Denver',
  'Sao Paulo (BRT)': 'America/Sao_Paulo',
  'Sarajevo (CET)': 'Europe/Sarajevo',
  'Skopje (CET)': 'Europe/Skopje',
  'Sofia (EET)': 'Europe/Sofia',
  'Tbilisi (GET)': 'Asia/Tbilisi',
  'Tegucigalpa (CST)': 'America/Tegucigalpa',
  'Tehran (IRST)': 'Asia/Tehran',
  'Vienna (CET)': 'Europe/Vienna',
  'Vilnius (EET)': 'Europe/Vilnius',
  'Wellington (NZDT)': 'Pacific/Auckland',
  'Yerevan (AMT)': 'Asia/Yerevan',
  'Zagreb (CET)': 'Europe/Zagreb',
  };

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
String getCurrentTime(String timeZone) {
    final location = tz.getLocation(timeZone);
    final now = tz.TZDateTime.now(location);
    final formatter = DateFormat('HH:mm:ss');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-Time Time Zones'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: ListView.builder(
        itemCount: timeZones.length,
        itemBuilder: (context, index) {
          final cityName = timeZones.keys.elementAt(index);
          final timeZone = timeZones.values.elementAt(index);
          final currentTime = getCurrentTime(timeZone);

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    cityName[0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cityName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        currentTime,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.access_time,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}