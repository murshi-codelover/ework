import 'package:cloud_firestore/cloud_firestore.dart'
    show DocumentReference, FirebaseFirestore;
import 'package:flutter/material.dart';
import 'package:newproject/constants/widgets/mytextfield.dart';

import '../../../../db/workmodel.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  State<WorksPage> createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _wageController = TextEditingController();
  final TextEditingController _workController = TextEditingController();
  final TextEditingController _discController = TextEditingController();
  final TextEditingController _workersController = TextEditingController();

  List<WorkModel> workList = [];
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    loadWorksFromFirestore();
  }

  Future<void> addWorkToFirestore(WorkModel work) async {
    try {
      DocumentReference docRef =
          await firestore.collection('works').add(work.toJson());
      WorkModel updatedWork = work.copyWith(id: docRef.id);
      await docRef.update(updatedWork.toJson()); // Update with the generated ID

      setState(() {
        workList.add(updatedWork);
      });
    } catch (e) {
      debugPrint('Error adding work: $e');
    }
  }

  /// Load all works from Firestore
  Future<void> loadWorksFromFirestore() async {
    final snapshot = await firestore.collection('works').get();
    setState(() {
      workList =
          snapshot.docs.map((doc) => WorkModel.fromFirestore(doc)).toList();
    });
  }

  Future<void> deleteWork(String docId) async {
    await firestore.collection('works').doc(docId).delete();
    setState(() {
      workList.removeWhere((work) => work.id == docId);
    });
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  void onSubmit() async {
    if (_dateController.text.isEmpty ||
        _timeController.text.isEmpty ||
        _locationController.text.isEmpty ||
        _wageController.text.isEmpty ||
        _workController.text.isEmpty ||
        _discController.text.isEmpty ||
        _workersController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required!')),
      );
      return;
    }

    WorkModel newWork = WorkModel(
      work: _workController.text,
      date: _dateController.text,
      time: _timeController.text,
      location: _locationController.text,
      wage: _wageController.text,
      description: _discController.text,
      workers: _workersController.text,
    );

    await addWorkToFirestore(newWork);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Details'),
      ),
      body: workList.isEmpty
          ? const Center(child: Text('No data available'))
          : ListView.builder(
              itemCount: workList.length,
              itemBuilder: (context, index) {
                final work = workList[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(work.work),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${work.date}'),
                        Text('Time: ${work.time}'),
                        Text('Location: ${work.location}'),
                        Text('Wage: ${work.wage}'),
                        Text('Description: ${work.description}'),
                        Text('Workers: ${work.workers}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteWork(work.id!),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: createWork,
        child: const Icon(Icons.add),
      ),
    );
  }

  void createWork() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyTextField(
                    HintText: 'Select a date',
                    LabelText: const Text('Date'),
                    controller: _dateController,
                    ObscureText: false,
                    suffixIcon: IconButton(
                        onPressed: () async => await _pickDate(context),
                        icon: const Icon(Icons.calendar_month_rounded))),
                MyTextField(
                    HintText: 'Time',
                    LabelText: const Text('Select a time'),
                    controller: _timeController,
                    ObscureText: false,
                    suffixIcon: IconButton(
                        onPressed: () async => await _pickTime(context),
                        icon: const Icon(Icons.timer))),
                MyTextField(
                    HintText: 'Location',
                    LabelText: const Text('Location'),
                    controller: _locationController,
                    ObscureText: false,
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_pin))),
                MyTextField(
                    HintText: 'Workers',
                    LabelText: const Text('Workers'),
                    controller: _workersController,
                    ObscureText: false,
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.person))),
                MyTextField(
                    HintText: 'Wage',
                    LabelText: const Text('Wage'),
                    controller: _wageController,
                    ObscureText: false,
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.currency_rupee))),
                MyTextField(
                    HintText: 'Work',
                    LabelText: const Text('Work'),
                    controller: _workController,
                    ObscureText: false,
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.event))),
                MyTextField(
                    HintText: 'Description',
                    LabelText: const Text('Description'),
                    controller: _discController,
                    ObscureText: false,
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.notes))),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel')),
                      TextButton(
                          onPressed: onSubmit, child: const Text('Submit'))
                    ]),
              ],
            ),
          ),
        );
      },
    );
  }
}
