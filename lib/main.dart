import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Widgets Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // ===== Dialog =====
  void showMyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thông báo'),
        content: const Text('Đây là một AlertDialog trong Material Design.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // ===== Date Picker =====
  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  // ===== Time Picker =====
  Future<void> pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //===== Scaffold =====
    return Scaffold(
      // ===== AppBar =====
      appBar: AppBar(
        title: const Text('Material Widgets Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: showMyDialog,
          ),
        ],
      ),

      // ===== Body =====
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: showMyDialog,
              child: const Text('Open Dialog'),
            ),
            const SizedBox(height: 12),

            ElevatedButton(onPressed: pickDate, child: const Text('Pick Date')),
            const SizedBox(height: 8),

            Text(
              selectedDate == null
                  ? 'Chưa chọn ngày'
                  : 'Ngày đã chọn: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
            ),

            const SizedBox(height: 12),

            ElevatedButton(onPressed: pickTime, child: const Text('Pick Time')),
            const SizedBox(height: 8),

            Text(
              selectedTime == null
                  ? 'Chưa chọn giờ'
                  : 'Giờ đã chọn: ${selectedTime!.format(context)}',
            ),
          ],
        ),
      ),

      // ===== Floating Action Button =====
      floatingActionButton: FloatingActionButton(
        onPressed: showMyDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
