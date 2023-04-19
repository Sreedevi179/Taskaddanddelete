import 'package:flutter/material.dart';
import 'package:addanddelete/constants.dart';
    import 'package:flutter/material.dart';

    import 'homepage.dart';

    void main() => runApp(ProgramCreatorApp());

    class ProgramCreatorApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Program Creator',
    theme: ThemeData(
    primarySwatch: Colors.blue,
    ),
    home: HomePage(),
    );
    }
    }

