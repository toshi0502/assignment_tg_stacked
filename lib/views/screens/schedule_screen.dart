import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _docNameController = TextEditingController();
  final TextEditingController _emailCCController = TextEditingController();
  TextEditingController datePickerController = TextEditingController();

  String? _dateErrorText;
  String? _timeErrorText;
  String? _docNameErrorText;
  String? _emailCCErrorText;
  @override
  void initState() {
    // TODO: implement initState
    print('createschedData:${_createSchedule}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    hintText: 'Enter date',
                    errorText: _dateErrorText,
                  ),
                  onTap: () async {
                    await _selectDate(context);
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Time',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _timeController,
                decoration: InputDecoration(
                  hintText: 'Enter time',
                  errorText: _timeErrorText,
                ),
                onTap: () async {
                  TimeOfDay time = TimeOfDay.now();
                  FocusScope.of(context).requestFocus(new FocusNode());

                  TimeOfDay? picked =
                      await showTimePicker(context: context, initialTime: time);
                  if (picked != null && picked != time) {
                    _timeController.text = picked.toString(); // add this line.
                    setState(() {
                      time = picked;
                    });
                  }
                },
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Doctor Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: TextFormField(
                  controller: _docNameController,
                  decoration: InputDecoration(
                    hintText: 'Enter doctor name',
                    errorText: _docNameErrorText,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Email CC',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: TextFormField(
                  controller: _emailCCController,
                  decoration: InputDecoration(
                    hintText: 'Enter email CC',
                    errorText: _emailCCErrorText,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _createSchedule,
                child: const Text('Create Schedule'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createSchedule() async {
    setState(() {
      _dateErrorText =
          _dateController.text.isEmpty ? 'Date cannot be empty' : null;
      _timeErrorText =
          _timeController.text.isEmpty ? 'Time cannot be empty' : null;
      _docNameErrorText = _docNameController.text.isEmpty
          ? 'Doctor name cannot be empty'
          : null;
      _emailCCErrorText =
          _emailCCController.text.isEmpty ? 'Email CC cannot be empty' : null;
    });

    if (_dateErrorText == null &&
        _timeErrorText == null &&
        _docNameErrorText == null &&
        _emailCCErrorText == null) {
      final Map<String, dynamic> requestData = {
        'date': _dateController.text,
        'time': _timeController.text,
        'doc_name': _docNameController.text,
        'online_meeting': 0,
        'email_cc': _emailCCController.text,
      };

      try {
        final response = await http.post(
          Uri.parse(
              'https://showdigital.in/flutter-schedules/create_schedule.php'),
          body: json.encode(requestData),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Schedule created successfully!'),
            duration: Duration(seconds: 2),
          ));

          _clearTextFields();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Failed to create schedule. Please try again later.'),
            duration: Duration(seconds: 2),
          ));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('An unexpected error occurred. Please try again later.'),
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  void _clearTextFields() {
    _dateController.clear();
    _timeController.clear();
    _docNameController.clear();
    _emailCCController.clear();
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _docNameController.dispose();
    _emailCCController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != DateTime.now()) {
      setState(() {
        _dateController.text = pickedDate.toString();
      });
    }
  }
}
