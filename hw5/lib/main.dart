import 'package:flutter/material.dart';

import 'database/database.dart';
import 'models/student.dart';

void main() {
  runApp(const Hw5());
}

class Hw5 extends StatelessWidget {
  const Hw5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final TextEditingController _studentNameController = TextEditingController();

  Future<List<Student>>? _studentsList;
  String _studentName = '';
  bool isUpdate = false;
  int? studentIdForUpdate;

  @override
  void initState() {
    super.initState();
    updateStudentsList();
  }

  updateStudentsList() {
    setState(() {
      _studentsList = DBProvider.db.getStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homework 5"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
            child: Form(
              key: _formStateKey,
              child: TextFormField(
                controller: _studentNameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.verified_user),
                  hintText: 'Enter your name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter student name';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _studentName = value!;
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  if (isUpdate) {
                    if (_formStateKey.currentState!.validate()) {
                      _formStateKey.currentState!.save();
                      DBProvider.db
                          .updateStudent(
                              Student(studentIdForUpdate, _studentName))
                          .then((data) {
                        setState(() {
                          isUpdate = false;
                        });
                      });
                    }
                  } else {
                    if (_formStateKey.currentState!.validate()) {
                      _formStateKey.currentState!.save();
                      DBProvider.db.addStudent(Student(null, _studentName));
                    }
                  }
                  _studentNameController.text = '';
                  updateStudentsList();
                },
                child: Text(isUpdate ? 'Edit' : 'Add'),
              ),
              const SizedBox(width: 15.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  _studentNameController.text = '';
                  setState(() {
                    isUpdate = false;
                    studentIdForUpdate = null;
                  });
                },
                child: Text(isUpdate ? 'Cancel update' : 'Delete'),
              )
            ],
          ),
          const Divider(),
          Expanded(
            child: FutureBuilder(
              future: _studentsList,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return generateList(snapshot.data);
                }
                if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Text('No data found');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView generateList(List<Student>? students) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text('Delete'),
            ),
          ],
          rows: students!
              .map(
                (student) => DataRow(
                  cells: [
                    DataCell(
                      Text(student.name),
                      onTap: () {
                        setState(() {
                          isUpdate = true;
                          studentIdForUpdate = student.id;
                        });
                        _studentNameController.text = student.name;
                      },
                    ),
                    DataCell(
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          DBProvider.db.deleteStudent(student.id);
                          updateStudentsList();
                        },
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
