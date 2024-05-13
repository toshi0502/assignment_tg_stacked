import 'package:assignment_tg/models/createsched_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  // ... other variables

  String _selectedCity = "mumbai";
  String _hos = "Abc";
  final List<String> _locations = ['Location 1', 'Location 2', 'Location 3'];
  final List<String> _hospitals = ['Hospital A', 'Hospital B', 'Hospital C'];

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _hospitalController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _prospectsController = TextEditingController();
  final TextEditingController _coworkerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ... other UI elements
        //  backgroundColor: Color.fromARGB(255, 184, 221, 252),
        body: Padding(
      padding: const EdgeInsets.only(top: 150.0, left: 15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Text fields for user input
            Text('Create New Schedule'),
            SizedBox(
              height: 30,
            ),
            // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //   Expanded(
            //     child: Container(
            //         color: Colors.amber,
            //         height: 50,
            //         width: 100,
            //         child: DropdownButton<DateTime>(
            //             items: ['Choose A Date']
            //                 .map((e) => DropdownMenuItem<DateTime>(
            //                         child: Text(
            //                       e,
            //                       style: TextStyle(fontSize: 10),
            //                     )))
            //                 .toList(),
            //             onChanged: (DateTime? value) {
            //               setState(() {
            //                 showDatePicker(
            //                         context: context,
            //                         initialDate: DateTime.now(),
            //                         firstDate: DateTime(2001),
            //                         lastDate: DateTime(2099))
            //                     .then((date) {
            //                   setState(() {
            //                     date = date;
            //                   });
            //                 });
            //               });
            //             })),
            //   ),
            //   Expanded(
            //     child: Container(
            //       height: 50,
            //       width: 50,
            //       color: Colors.red,
            //       child: DropdownButtonFormField<String>(
            //         //  value: CreateScheduleViewModel().date,
            //         items: const [
            //           DropdownMenuItem(
            //               value: "2023-05-14", child: Text('May 14, 2023')),
            //           DropdownMenuItem(
            //               value: "2023-05-15", child: Text('May 15, 2023')),
            //           // ... other date options
            //         ],
            //         onChanged: (value) =>
            //             CreateScheduleViewModel().date = value!,
            //         hint: Text('Select Date'),
            //       ),
            //     ),
            //   ),
            //   Expanded(
            //     child: Container(
            //         height: 50,
            //         width: 50,
            //         color: Colors.yellow,
            //         child: DropdownButton<String>(
            //           //  value: 'mumbai',
            //           hint: Text(
            //             'Select Hspital',
            //             style: TextStyle(fontSize: 10),
            //           ),
            //           items: _hospitals
            //               .map((_hospitals) => DropdownMenuItem(
            //                     value: _hospitals,
            //                     child: Text(_hospitals),
            //                   ))
            //               .toList(),
            //           onChanged: (value) =>
            //               setState(() => _selectedCity = value!),
            //         )),
            //   )
            DropdownButtonFormField<String>(
              hint: Text(
                'Select a date',
                style: TextStyle(fontSize: 10),
              ),
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedCity = value!);
              },
            ),
            DropdownButtonFormField<String>(
              hint: Text(
                'Location/Station',
                style: TextStyle(fontSize: 10),
              ),
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedCity = value!);
              },
            ),
            DropdownButtonFormField<String>(
              hint: Text(
                'Hospital/Site name',
                style: TextStyle(fontSize: 10),
              ),
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedCity = value!);
              },
            ),
            SizedBox(
              height: 30,
            ),

            DropdownButtonFormField<String>(
              hint: Text(
                'Select a time*',
                style: TextStyle(fontSize: 10),
              ),
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedCity = value!);
              },
            ),
            DropdownButtonFormField<String>(
              hint: Text(
                'Prospects*',
                style: TextStyle(fontSize: 10),
              ),
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedCity = value!);
              },
            ),
            DropdownButtonFormField<String>(
              hint: Text(
                'Co Worker',
                style: TextStyle(fontSize: 10),
              ),
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => _selectedCity = value!);
              },
            )
          ]),
      // ... other UI elements (buttons, etc.)
      // ],
    ));
  }
}
