import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../viewmodels/task_viewmodel.dart';
import 'login_view.dart';
import 'dart:math';

class TaskListView extends StatelessWidget {
  final String email;
  const TaskListView({required this.email});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: TaskListScreen(email: email),
    );
  }
}

class TaskListScreen extends StatelessWidget {
  final String email;
  const TaskListScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TaskViewModel>(context);

    void _showAddOrEditTaskDialog({Task? task}) {
      final titleController = TextEditingController(text: task?.title ?? '');
      final descController = TextEditingController(
        text: task?.description ?? '',
      );
      DateTime? selectedDate =
          task?.dueDate ?? DateTime.now().add(Duration(days: 1));

      Future<void> _pickDate() async {
        final picked = await showDatePicker(
          context: context,
          initialDate: selectedDate!,
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (picked != null) selectedDate = picked;
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(task == null ? 'Add Task' : 'Edit Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Deadline: ${selectedDate!.toLocal().toString().split(' ')[0]}',
                    ),
                    TextButton(onPressed: _pickDate, child: Text('Pick Date')),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty) {
                    final newTask = Task(
                      id: task?.id ?? Random().nextInt(10000).toString(),
                      title: titleController.text,
                      description: descController.text,
                      dueDate: selectedDate!,
                      isCompleted: task?.isCompleted ?? false,
                    );
                    if (task == null) {
                      viewModel.addTask(newTask);
                    } else {
                      viewModel.updateTask(newTask);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(task == null ? 'Add' : 'Save'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $email'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            },
          ),
        ],
      ),
      body: viewModel.tasks.isEmpty
          ? Center(child: Text('No tasks yet.'))
          : ListView.builder(
              itemCount: viewModel.tasks.length,
              itemBuilder: (context, index) {
                final task = viewModel.tasks[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(
                      task.title,
                      style: TextStyle(
                        decoration: task.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(task.description),
                        SizedBox(height: 4),
                        Text(
                          'Deadline: ${task.dueDate.toLocal().toString().split(' ')[0]}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 4,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showAddOrEditTaskDialog(task: task),
                        ),
                        IconButton(
                          icon: Icon(
                            task.isCompleted
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: task.isCompleted
                                ? Colors.green
                                : Colors.grey,
                          ),
                          onPressed: () => viewModel.toggleComplete(task.id),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => viewModel.deleteTask(task.id),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddOrEditTaskDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
