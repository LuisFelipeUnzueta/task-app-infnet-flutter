import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app_infnet/providers/task_provider.dart';
import 'package:task_app_infnet/screens/about_screen.dart';
import 'package:task_app_infnet/components/task_form.dart';
import 'package:task_app_infnet/components/task_list.dart';
import 'package:task_app_infnet/models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'about_screen');
              },
              icon: const Icon(Icons.info_outline))
        ],
      ),
      body: const TaskList(),
      drawer: Drawer(
          child: Column(
        children: [
          ListTile(
            title: const Text('Task List'),
            leading: const Icon(Icons.list_alt),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, '');
            },
          ),
          ListTile(
            title: const Text('Insert Task'),
            leading: const Icon(Icons.new_label_outlined),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, 'task_insert_screen');
            },
          ),
          ListTile(
            title: const Text('About us'),
            leading: const Icon(Icons.info),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pushNamed(context, 'about_screen');
            },
          )
        ],
      )),
    );
  }
}
