import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onestop_ui/index.dart'; // For OColor and ThemeStore

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final DateTime originalDate = DateTime.now(); // Today
  late DateTime selectedDate; // User-selected date
  late int selectedDay;       // Day number to follow across months
  late DateTime currentMonth; // First day of current displayed month

  @override
  void initState() {
    super.initState();
    selectedDate = originalDate;
    selectedDay = selectedDate.day;
    currentMonth = DateTime(selectedDate.year, selectedDate.month, 1);
  }

  @override
  Widget build(BuildContext context) {
    final themeStore = ThemeStore(); // Your existing theme store
    final textColor = themeStore.textColor;
    final bgColor = Colors.white; // Bright theme white background

    // Calculate first and last day of month
    final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDayOfMonth = DateTime(currentMonth.year, currentMonth.month + 1, 0);

    int startWeekday = firstDayOfMonth.weekday; // 1=Monday
    int daysInMonth = lastDayOfMonth.day;

    // Previous month trailing dates
    List<Widget> dayWidgets = [];
    DateTime prevMonth = DateTime(currentMonth.year, currentMonth.month - 1);
    int prevMonthDays = DateTime(prevMonth.year, prevMonth.month + 1, 0).day;

    for (int i = startWeekday - 1; i > 0; i--) {
      int day = prevMonthDays - i + 1;
      dayWidgets.add(
        Center(
          child: Text(
            '$day',
            style: TextStyle(color: Color(0xFF6E6F77), fontSize: 14),
          ),
        ),
      );
    }

    // Current month dates
    for (int day = 1; day <= daysInMonth; day++) {
      DateTime date = DateTime(currentMonth.year, currentMonth.month, day);
      bool isOriginal = _isSameDay(date, originalDate);
      bool isSelected = day == selectedDay;

      dayWidgets.add(
        GestureDetector(
          onTap: () => setState(() {
            selectedDay = day;
            selectedDate = date;
          }),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Selected day: green circle with white dot
              if (isSelected) buildSelectedDay(OColor.green600),

              // Day number
              Text(
                '$day',
                style: TextStyle(
                  color: isSelected ? Colors.white : Color(0xFF232329),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),

              // Original date green dot
              if (isOriginal) Positioned(bottom: 5, child: buildOriginalDay(OColor.green600)),
            ],
          ),
        ),
      );
    }

    // Fill remaining cells for complete week
   // Fill remaining cells for next month to complete the week
int totalCells = dayWidgets.length;
int remainingCells = (totalCells % 7 == 0) ? 0 : (7 - totalCells % 7);

for (int i = 0; i < remainingCells; i++) {
  int day = i + 1;
  dayWidgets.add(
    Center(
      child: Text(
        '$day',
        style: TextStyle(color: Color(0xFF6E6F77), fontSize: 14),
      ),
    ),
  );
}



    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // Month navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.chevron_left, color: textColor),
                  onPressed: () => setState(() => currentMonth = DateTime(
                        currentMonth.year,
                        currentMonth.month - 1,
                        1,
                      )),
                ),
                Text(
                  DateFormat.yMMMM().format(currentMonth),
                  style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF232329)),
                ),
                IconButton(
                  icon: Icon(Icons.chevron_right, color: textColor),
                  onPressed: () => setState(() => currentMonth = DateTime(
                        currentMonth.year,
                        currentMonth.month + 1,
                        1,
                      )),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Weekday headers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
                  .map((d) => Expanded(
                        child: Center(
                          child: Text(
                            d,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Color(0xFF232329)),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 8),

            // Dates grid
            SizedBox(
              height: 300,
              child: GridView.count(
                crossAxisCount: 7,
                children: dayWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Selected day: green circle with white dot inside
  Widget buildSelectedDay(Color green) {
  return Container(
    width: 36,
    height: 36,
    decoration: BoxDecoration(
      color: green,
      shape: BoxShape.circle,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end, // keep at bottom
      children: [
        SizedBox(height: 4), // small gap from bottom
        Container(
          width: 5,
          height: 5,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 4), // optional extra padding if needed
      ],
    ),
  );
}


  // Original date: small green dot
  Widget buildOriginalDay(Color green) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end, // keep at bottom of the cell
    children: [
      SizedBox(height: 4), // space from date number
      Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(color: green, shape: BoxShape.circle),
      ),
      SizedBox(height: 4), // optional extra bottom padding
    ],
  );
}

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
