import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../viewmodels/task_viewmodel.dart';
import '../providers/theme_provider.dart';
import 'login_view.dart';
import 'dart:math';

class TaskListView extends StatelessWidget {
  final String userName;
  const TaskListView({required this.userName, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: TaskListScreen(userName: userName),
    );
  }
}

class TaskListScreen extends StatelessWidget {
  final String userName;
  const TaskListScreen({required this.userName, super.key});

  void _showAddOrEditTaskDialog({
    required BuildContext context,
    required TaskViewModel viewModel,
    Task? task,
  }) {
    final titleController = TextEditingController(text: task?.title ?? '');
    final descController = TextEditingController(
      text: task?.description ?? '',
    );
    DateTime? selectedDate =
        task?.dueDate ?? DateTime.now().add(const Duration(days: 1));

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            Future<void> pickDate() async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate!,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  // Use setState from StatefulBuilder to redraw the dialog content
                  setState(() {
                    selectedDate = picked;
                  });
                }
              }

            return AlertDialog(
              title: Text(task == null ? 'Add Task' : 'Edit Task'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: descController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Deadline: ${selectedDate!.toLocal().toString().split(' ')[0]}',
                      ),
                      TextButton(
                        onPressed: pickDate,
                        child: const Text('Pick Date'),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $userName'),
        centerTitle: true,
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                onPressed: () {
                  themeProvider.toggleTheme();
                },
                icon: Icon(
                  themeProvider.isDarkMode
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
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
          ? const Center(child: Text('Make yourself busy!'))
          : ListView.builder(
              itemCount: viewModel.tasks.length,
              itemBuilder: (context, index) {
                final task = viewModel.tasks[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
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
                        const SizedBox(height: 4),
                        Text(
                          'Deadline: ${task.dueDate.toLocal().toString().split(' ')[0]}',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withValues(alpha: 0.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 4,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _showAddOrEditTaskDialog(
                            context: context,
                            viewModel: viewModel,
                            task: task,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            task.isCompleted
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                          ),
                          onPressed: () => viewModel.toggleComplete(task.id),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => viewModel.deleteTask(task.id),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddOrEditTaskDialog(
          context: context,
          viewModel: viewModel,
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
