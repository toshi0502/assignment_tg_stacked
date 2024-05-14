import 'dart:convert';
import 'package:assignment_tg/views/screens/editschedule_screen.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List<Map<String, dynamic>> _scheduleList = [];

  @override
  void initState() {
    super.initState();
    _fetchScheduleList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _scheduleList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _scheduleList.length,
                    itemBuilder: (context, index) {
                      return _buildScheduleCard(_scheduleList[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleCard(Map<String, dynamic> schedule) {
    return Card(
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date: ${schedule['date']}'),
              Text('Time: ${schedule['time']}'),
              Text('Doctor Name: ${schedule['doc_name']}'),
              Text('Online Meeting: ${schedule['online_meeting']}'),
              Text('Email CC: ${schedule['email_cc']}'),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (context) =>
                            EditScheduleScreen(schedule: schedule),
                      ),
                    )
                        .then((editedSchedule) {
                      if (editedSchedule != null) {
                        setState(() {
                          _updateSchedule(schedule, editedSchedule);
                        });
                      }
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    final bool isDeleted =
                        await _deleteSchedule(schedule['id']);
                    if (isDeleted) {
                      setState(() {
                        _scheduleList.remove(schedule);
                      });
                    } else {}
                  },
                ),
              ]),
            ],
          ),
        ));
  }

  Future<void> _fetchScheduleList() async {
    try {
      final response = await http.get(Uri.parse(
          'https://showdigital.in/flutter-schedules/list_schedule.php'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _scheduleList = responseData.cast<Map<String, dynamic>>();
        });
      } else {}
    } catch (e) {}
  }

  Future<bool> _deleteSchedule(String? id) async {
    try {
      final response = await http.delete(
        Uri.parse(
            'https://showdigital.in/flutter-schedules/delete_schedule.php?id=$id'),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  void _updateSchedule(Map<String, dynamic> originalSchedule,
      Map<String, dynamic> editedSchedule) {
    originalSchedule['date'] = editedSchedule['date'];
    originalSchedule['time'] = editedSchedule['time'];
    originalSchedule['doc_name'] = editedSchedule['doc_name'];
    originalSchedule['online_meeting'] = editedSchedule['online_meeting'];
    originalSchedule['email_cc'] = editedSchedule['email_cc'];
  }
}
