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
  String selectedGender = "Chưa chọn giới tính";

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

  // ===== SimpleDialog =====
  void showMySimpleDialog() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Vui lòng chọn giới tính'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              setState(() => selectedGender = "Nam");
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Nam', style: TextStyle(fontSize: 16)),
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              setState(() => selectedGender = "Nữ");
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Nữ', style: TextStyle(fontSize: 16)),
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              setState(() => selectedGender = "Khác");
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Khác', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  // ===== AboutDialog =====
  void showMyAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: 'Thông tin Sinh viên',
      applicationVersion: 'MSSV: 12345678',
      applicationIcon: const CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(Icons.school, color: Colors.white),
      ),
      applicationLegalese:
          'Họ và tên: Nguyễn Văn A\nLớp: CNTT K14\nKhoa: Công nghệ thông tin',
      children: [
        const SizedBox(height: 10),
        const Text('Demo các loại Dialogs.'),
      ],
    );
  }

  // ===== Date Picker =====
  Future<void> pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      helpText: 'CHỌN NGÀY',
      cancelText: 'HỦY',
      confirmText: 'XÁC NHẬN',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.indigo,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.indigo),
            ),
          ),
          child: child!,
        );
      },
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
      initialTime: selectedTime ?? TimeOfDay.now(),
      helpText: 'CHỌN GIỜ',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.teal,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.teal),
            ),
          ),
          child: child!,
        );
      },
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===== AppBar =====
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 76,
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.widgets_outlined, color: Colors.deepPurple),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Material Widgets',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Material Demo',
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Notifications',
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.star_border),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Info',
            icon: const Icon(Icons.info_outline),
            onPressed: showMyAboutDialog,
          ),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey.shade200),
        ),
      ),

      // ===== Body =====
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: showMyDialog,
                    child: const Text('AlertDialog'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: showMySimpleDialog,
                    child: const Text('SimpleDialog'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Giới tính: $selectedGender',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            //Date Picker UI
            InkWell(
              onTap: pickDate,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo.shade400, Colors.blue.shade900],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ngày đã chọn',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          selectedDate == null
                              ? 'Chưa chọn ngày'
                              : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white54,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            //Time Picker UI
            InkWell(
              onTap: pickTime,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade400, Colors.green.shade800],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.access_time_filled,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Giờ đã chọn',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          selectedTime == null
                              ? 'Chưa chọn giờ'
                              : selectedTime!.format(context),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white54,
                      size: 18,
                    ),
                  ],
                ),
              ),
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
