import 'package:flutter/material.dart';
import 'package:newproject/constants/widgets/mytextfield.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  State<WorksPage> createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _wageController = TextEditingController();
  TextEditingController _workController = TextEditingController();
  TextEditingController _discController = TextEditingController();

  DateTime? selectedDate;
  DateTime? selectedTime;

  // Function to show the date picker
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(), // Default selected date
      firstDate: DateTime(2000), // Earliest date
      lastDate: DateTime(2100), // Latest date
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    selectedTime = pickedTime as DateTime?;

    if (pickedTime != null) {
      _timeController.text = pickedTime.format(context);
    }
  }

  void createWork() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              width: double.infinity,
              height: 500,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MyTextField(
                      HintText: 'Select a date',
                      LabelText: const Text('Date'),
                      controller: _dateController,
                      ObscureText: false,
                      suffixIcon: IconButton(
                        onPressed: () async {
                          await _pickDate(context);
                          if (selectedDate != null) {
                            _dateController.text =
                                selectedDate!.toString().split(' ')[0];
                          }
                        },
                        icon: Icon(Icons.calendar_month_rounded),
                      ),
                    ),
                    MyTextField(
                      HintText: 'Time',
                      LabelText: const Text('Time'),
                      controller: _timeController,
                      ObscureText: false,
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (selectedTime != null) {
                              _timeController.text = selectedTime!.toString();
                            }
                            _pickTime(context);
                          },
                          icon: Icon(Icons.timer)),
                    ),
                    MyTextField(
                      HintText: 'Location',
                      LabelText: const Text('Location'),
                      controller: _dateController,
                      ObscureText: false,
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search)),
                    ),
                    MyTextField(
                      HintText: 'Wage',
                      LabelText: const Text('Wage'),
                      controller: _dateController,
                      ObscureText: false,
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search)),
                    ),
                    MyTextField(
                      HintText: 'Work',
                      LabelText: const Text('Work'),
                      controller: _dateController,
                      ObscureText: false,
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search)),
                    ),
                    MyTextField(
                      HintText: 'Discription',
                      LabelText: const Text('Discription'),
                      controller: _dateController,
                      ObscureText: false,
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel')),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Submit')),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createWork,
        child: const Icon(Icons.add),
      ),
    );
  }
}
