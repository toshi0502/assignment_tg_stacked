import 'package:flutter/material.dart';

class EditScheduleScreen extends StatefulWidget {
  final Map<String, dynamic> schedule;

  const EditScheduleScreen({Key? key, required this.schedule})
      : super(key: key);

  @override
  _EditScheduleScreenState createState() => _EditScheduleScreenState();
}

class _EditScheduleScreenState extends State<EditScheduleScreen> {
  late TextEditingController _dateController;
  late TextEditingController _timeController;
  late TextEditingController _docNameController;
  late TextEditingController _emailCCController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: widget.schedule['date']);
    _timeController = TextEditingController(text: widget.schedule['time']);
    _docNameController =
        TextEditingController(text: widget.schedule['doc_name']);
    _emailCCController =
        TextEditingController(text: widget.schedule['email_cc']);
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _docNameController.dispose();
    _emailCCController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Schedule'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Time'),
            ),
            TextField(
              controller: _docNameController,
              decoration: InputDecoration(labelText: 'Doctor Name'),
            ),
            TextField(
              controller: _emailCCController,
              decoration: InputDecoration(labelText: 'Email CC'),
            ),
            ElevatedButton(
              onPressed: () {
                Map<String, dynamic> editedSchedule = {
                  'date': _dateController.text,
                  'time': _timeController.text,
                  'doc_name': _docNameController.text,
                  'online_meeting': widget.schedule['online_meeting'],
                  'email_cc': _emailCCController.text,
                };
                Navigator.of(context).pop(editedSchedule);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
