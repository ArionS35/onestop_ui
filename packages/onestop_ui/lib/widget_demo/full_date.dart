import 'package:flutter/material.dart';

class DateMonthYearPicker extends StatefulWidget {
  const DateMonthYearPicker({super.key});

  @override
  State<DateMonthYearPicker> createState() => _DateMonthYearPickerState();
}

class _DateMonthYearPickerState extends State<DateMonthYearPicker> {
  int currentDay = DateTime.now().day;
  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;

  final List<String> months = const [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"
  ];

  void _increaseDay() {
    int daysInMonth = DateTime(currentYear, currentMonth + 1, 0).day;
    setState(() {
      currentDay++;
      if (currentDay > daysInMonth) {
        currentDay = 1;
        _increaseMonth();
      }
    });
  }

  void _decreaseDay() {
    int daysInMonth = DateTime(currentYear, currentMonth, 0).day;
    setState(() {
      currentDay--;
      if (currentDay < 1) {
        _decreaseMonth();
        currentDay = DateTime(currentYear, currentMonth + 1, 0).day;
      }
    });
  }

  void _increaseMonth() {
    setState(() {
      currentMonth++;
      if (currentMonth > 12) {
        currentMonth = 1;
        _increaseYear();
      }
    });
  }

  void _decreaseMonth() {
    setState(() {
      currentMonth--;
      if (currentMonth < 1) {
        currentMonth = 12;
        _decreaseYear();
      }
    });
  }

  void _increaseYear() {
    if (currentYear < 2025) setState(() => currentYear++);
  }

  void _decreaseYear() {
    setState(() => currentYear--);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;

    final bgColor = isLight ? Colors.white : theme.scaffoldBackgroundColor;
    final mainColor = isLight ? Color(0xFF232329) : Colors.white;
    final fadedColor = isLight ? Color(0xFFBABABF) : Color(0xFF6E6F77);

    const dayWidth = 50.0;
    const monthWidth = 60.0;
    const yearWidth = 70.0;

    int prevDay = currentDay - 1 < 1 ? DateTime(currentYear, currentMonth, 0).day : currentDay - 1;
    int nextDay = (currentDay % DateTime(currentYear, currentMonth + 1, 0).day) + 1;

    String prevMonth = months[(currentMonth - 2 + 12) % 12];
    String nextMonth = months[currentMonth % 12];

    String prevYear = (currentYear - 1).toString();
    String nextYear = currentYear < 2025 ? (currentYear + 1).toString() : '';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Row 1: Up arrows
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: dayWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up, color: fadedColor),
                  onPressed: _increaseDay,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: monthWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up, color: fadedColor),
                  onPressed: _increaseMonth,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: yearWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up, color: fadedColor),
                  onPressed: _decreaseYear,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
            ],
          ),

          // Row 2: Previous values
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: dayWidth,
                child: Text(prevDay.toString(), style: TextStyle(color: fadedColor, fontSize: 18), textAlign: TextAlign.center),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: monthWidth,
                child: Text(prevMonth, style: TextStyle(color: fadedColor, fontSize: 18), textAlign: TextAlign.center, softWrap: false),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: yearWidth,
                child: Text(nextYear, style: TextStyle(color: fadedColor, fontSize: 18), textAlign: TextAlign.center),
              ),
            ],
          ),
          SizedBox(height: 4),

          // Row 3: Selected values
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: dayWidth,
                child: Text(currentDay.toString(), style: TextStyle(color: mainColor, fontSize: 22, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: monthWidth,
                child: Text(months[currentMonth - 1], style: TextStyle(color: mainColor, fontSize: 22, fontWeight: FontWeight.w500), textAlign: TextAlign.center, softWrap: false),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: yearWidth,
                child: Text(currentYear.toString(), style: TextStyle(color: mainColor, fontSize: 22, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
              ),
            ],
          ),
          SizedBox(height: 4),

          // Row 4: Next values
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: dayWidth,
                child: Text(nextDay.toString(), style: TextStyle(color: fadedColor, fontSize: 18), textAlign: TextAlign.center),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: monthWidth,
                child: Text(nextMonth, style: TextStyle(color: fadedColor, fontSize: 18), textAlign: TextAlign.center, softWrap: false),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: yearWidth,
                child: Text(prevYear, style: TextStyle(color: fadedColor, fontSize: 18), textAlign: TextAlign.center),
              ),
            ],
          ),
          SizedBox(height: 4),

          // Row 5: Down arrows
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: dayWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: fadedColor),
                  onPressed: _decreaseDay,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: monthWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: fadedColor),
                  onPressed: _decreaseMonth,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: yearWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: fadedColor),
                  onPressed: _increaseYear,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
