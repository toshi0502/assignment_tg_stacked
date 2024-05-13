import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stacked/stacked.dart';

class CreateScheduleViewModel extends BaseViewModel {
  // Form field properties (replace with appropriate types)
  List<String>? dates; // Consider using a nullable type

  List<DropdownMenuItem<String>> getDropdownMenuItems() {
    if (dates == null)
      return []; // Handle case where dates haven't been fetched
    return dates!
        .map((date) => DropdownMenuItem(value: date, child: Text(date)))
        .toList();
  }

  String date = "";
  String time = "";
  String docName = "";
  bool onlineMeeting = false; // Consider using a boolean for online meeting
  String emailCc = "";
  final String createUrl =
      "https://showdigital.in/flutter-schedules/create_schedule.php";

  // Function to create a schedule and handle API response
  Future<bool> createSchedule() async {
    // Prepare request body based on form data
    final Map<String, dynamic> scheduleData = {
      "date": date,
      "time": time,
      "doc_name": docName,
      "online_meeting": onlineMeeting ? 1 : 0, // Convert bool to int for API
      "email_cc": emailCc,
    };

    try {
      final response =
          await post(Uri.parse(createUrl), body: jsonEncode(scheduleData));
      if (response.statusCode == 200) {
        // Handle successful creation (e.g., navigate back, show success message)
        return true;
      } else {
        // Handle API error (e.g., show error message)
        notifyListeners(); // Inform UI about error (optional)
        return false;
      }
    } catch (e) {
      print("Error creating schedule: $e");
      notifyListeners(); // Inform UI about error (optional)
      return false;
    }
  }

  // Implement functions to update form field values based on user input
  void setDate(String value) {
    date = value;
    notifyListeners();
  }

  // Similar functions for other form fields (time, docName, onlineMeeting, emailCc)
}
