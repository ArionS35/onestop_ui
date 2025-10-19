import 'package:flutter/material.dart';

class MonthYearPicker extends StatefulWidget {
  const MonthYearPicker({super.key});

  @override
  State<MonthYearPicker> createState() => _MonthYearPickerState();
}

class _MonthYearPickerState extends State<MonthYearPicker> {
  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;

  final List<String> months = const [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

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
    final textColor = isLight ? Color(0xFF232329) : Colors.white;
    final fadedColor = isLight ? Color(0xFFBABABF) : Color(0xFF6E6F77);

    final mainStyle = TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: textColor);
    final fadedStyle = TextStyle(fontSize: 18, color: fadedColor);

    const monthWidth = 150.0;
    const yearWidth = 80.0;

    // Previous and next values
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
                width: monthWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up),
                  onPressed: _increaseMonth,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: yearWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up),
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
                width: monthWidth,
                child: Text(prevMonth, style: fadedStyle, textAlign: TextAlign.center, softWrap: false),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: yearWidth,
                child: Text(nextYear, style: fadedStyle, textAlign: TextAlign.center),
              ),
            ],
          ),
          SizedBox(height: 3),

          // Row 3: Selected values
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: monthWidth,
                child: Text(months[currentMonth - 1], style: mainStyle, textAlign: TextAlign.center, softWrap: false),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: yearWidth,
                child: Text(currentYear.toString(), style: mainStyle, textAlign: TextAlign.center),
              ),
            ],
          ),
          SizedBox(height: 3),

          // Row 4: Next values
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: monthWidth,
                child: Text(nextMonth, style: fadedStyle, textAlign: TextAlign.center, softWrap: false),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: yearWidth,
                child: Text(prevYear, style: fadedStyle, textAlign: TextAlign.center),
              ),
            ],
          ),

          // Row 5: Down arrows
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: monthWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: _decreaseMonth,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: yearWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
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
