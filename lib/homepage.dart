import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final _exercises = <Exercise>[    Exercise(name: 'Push-ups'),    Exercise(name: 'Squats'),    Exercise(name: 'Sit-ups'),  ];

  String? _selectedExercise;
  void _addExercise() {
    if (_selectedExercise == null) {
      return;
    }

    setState(() {
      _exercises.add(Exercise(
        name: _selectedExercise!,
      ));
      _selectedExercise = null;
    });

    Navigator.pop(context);
  }

  void _deleteExercise(int index) {
    setState(() {
      _exercises.removeAt(index);
    });
  }

  List<String> programs = [];
  String newProgramName = '';
  bool isFormVisible = false;

  void _showForm() {
    setState(() {
      isFormVisible = true;
    });
  }

  void _hideForm() {
    setState(() {
      isFormVisible = false;
    });
  }

  void _saveProgram() {
    setState(() {
      programs.add(newProgramName);
      newProgramName = '';
      _hideForm();
    });
  }

  void _deleteProgram(int index) {
    setState(() {
      programs.removeAt(index);
    });
  }
  List<String> programstwo = [];
  String newProgramTwoName = '';
  bool isFormTwoVisible = false;

  void _showFormTwo() {
    setState(() {
      isFormTwoVisible = true;
    });
  }

  void _hideFormTwo() {
    setState(() {
      isFormTwoVisible = false;
    });
  }

  void _saveProgramTwo() {
    setState(() {
      programstwo.add(_selectedExercise!);
      _selectedExercise = '';
      _hideFormTwo();
    });
  }

  void _deleteProgramTwo(int index) {
    setState(() {
      programstwo.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Program Creator')),
      body: Column(
        children: [
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _showForm,
                child: Text('Create Program'),
              ),
              SizedBox(width: 32),
              ElevatedButton(
                onPressed: _showFormTwo,
                child: Text('Create Exercise'),
              ),
            ],
          ),
          SizedBox(height: 32),
          if (isFormTwoVisible)
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Create Exercise', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 16),
                    DropdownButton(
                      value: _selectedExercise,
                      items: <String>[
                        'Push-ups',
                        'Squats',
                        'Sit-ups',
                        'Lunges',
                        'Plank',
                        'Jumping jacks',
                        'Burpees',
                        'Bicycle crunches',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedExercise = value;
                        });
                      },
                      hint: Text('Select exercise'),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _saveProgramTwo, 
                      child: Text('Save'),
                    ),
                    ElevatedButton(
                      onPressed: _hideFormTwo,
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: programstwo.length,
              itemBuilder: (context, index) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: .5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: Text(programstwo[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteProgramTwo(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.expand_more_outlined ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (isFormVisible)
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Create Program', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 16),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          newProgramName = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Program Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _saveProgram,
                      child: Text('Save'),
                    ),
                    ElevatedButton(
                      onPressed: _hideForm,
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: programs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: .5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: Text(programs[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteProgram(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.expand_more_outlined ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
