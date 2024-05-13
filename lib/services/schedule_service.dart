import 'dart:convert';
import 'package:http/http.dart' as http;

class ScheduleService {
  final String createUrl =
      "https://showdigital.in/flutter-schedules/create_schedule.php";
  final String listUrl =
      "https://showdigital.in/flutter-schedules/list_schedule.php";
  final String updateUrl =
      "https://showdigital.in/flutter-schedules/update_schedule.php";
  final String deleteUrl =
      "https://showdigital.in/flutter-schedules/delete_schedule.php";

  Future<bool> createSchedule(Map<String, dynamic> scheduleData) async {
    try {
      final response =
          await http.post(Uri.parse(createUrl), body: jsonEncode(scheduleData));
      if (response.statusCode == 200) {
        return true; // Schedule created successfully
      } else {
        return false; // Failed to create schedule
      }
    } catch (e) {
      print("Error creating schedule: $e");
      return false; // Failed to create schedule
    }
  }

  Future<List<Map<String, dynamic>>> fetchSchedules() async {
    try {
      final response = await http.get(Uri.parse(listUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<Map<String, dynamic>> schedules = [];
        for (var data in jsonData) {
          schedules.add(data);
        }
        return schedules;
      } else {
        return []; // Failed to fetch schedules
      }
    } catch (e) {
      print("Error fetching schedules: $e");
      return []; // Failed to fetch schedules
    }
  }

  Future<bool> updateSchedule(Map<String, dynamic> updatedData) async {
    try {
      final response =
          await http.post(Uri.parse(updateUrl), body: jsonEncode(updatedData));
      if (response.statusCode == 200) {
        return true; // Schedule updated successfully
      } else {
        return false; // Failed to update schedule
      }
    } catch (e) {
      print("Error updating schedule: $e");
      return false; // Failed to update schedule
    }
  }

  Future<bool> deleteSchedule(String id) async {
    try {
      final response = await http.get(Uri.parse('$deleteUrl?id=$id'));
      if (response.statusCode == 200) {
        return true; // Schedule deleted successfully
      } else {
        return false; // Failed to delete schedule
      }
    } catch (e) {
      print("Error deleting schedule: $e");
      return false; // Failed to delete schedule
    }
  }
}
