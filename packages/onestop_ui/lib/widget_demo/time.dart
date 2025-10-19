import 'package:flutter/material.dart';

class ClockTime extends StatefulWidget {
  const ClockTime({super.key});

  @override
  State<ClockTime> createState() => _ClockTimeState();
}

class _ClockTimeState extends State<ClockTime> {
  int hour = 9;
  int minute = 13;
  String period = 'PM';

  void _increaseHour() => setState(() => hour = (hour % 12) + 1);
  void _decreaseHour() => setState(() => hour = (hour - 1) < 1 ? 12 : hour - 1);

  void _increaseMinute() => setState(() => minute = (minute + 1) % 60);
  void _decreaseMinute() => setState(() => minute = (minute - 1) < 0 ? 59 : minute - 1);

  void _togglePeriod() => setState(() => period = period == 'AM' ? 'PM' : 'AM');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;

    final bgColor = isLight ? Colors.white : theme.scaffoldBackgroundColor;
    final textColor = isLight ? Color(0xFF232329) : Colors.white;
    final fadedColor = isLight ? Color(0xFFBABABF) : Color(0xFF6E6F77);

    final mainStyle = TextStyle(fontSize: 36, fontWeight: FontWeight.w500, color: textColor);
    final fadedStyle = TextStyle(fontSize: 20, color: fadedColor);

    const hourWidth = 50.0;
    const minuteWidth = 50.0;
    const periodWidth = 65.0; // increased to prevent wrapping

    // Previous and next values
    int prevHour = (hour - 1) < 1 ? 12 : hour - 1;
    int nextHour = (hour % 12) + 1;

    int prevMinute = (minute - 1) < 0 ? 59 : minute - 1;
    int nextMinute = (minute + 1) % 60;

    String abovePeriod = period == 'PM' ? 'AM' : '';
    String belowPeriod = period == 'AM' ? 'PM' : '';

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
                width: hourWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up),
                  onPressed: _increaseHour,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: minuteWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up),
                  onPressed: _increaseMinute,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: periodWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up),
                  onPressed: _togglePeriod,
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
                width: hourWidth,
                child: Text(prevHour.toString().padLeft(2, '0'), style: fadedStyle, textAlign: TextAlign.center),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: minuteWidth,
                child: Text(prevMinute.toString().padLeft(2, '0'), style: fadedStyle, textAlign: TextAlign.center),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: periodWidth,
                child: abovePeriod.isNotEmpty
                    ? Text(abovePeriod, style: fadedStyle, textAlign: TextAlign.center)
                    : SizedBox(),
              ),
            ],
          ),

          // Row 3: Selected values
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: hourWidth,
                child: Text(hour.toString().padLeft(2, '0'), style: mainStyle, textAlign: TextAlign.center),
              ),
              SizedBox(width: 4),
              Text(':', style: mainStyle),
              SizedBox(width: 4),
              SizedBox(
                width: minuteWidth,
                child: Text(minute.toString().padLeft(2, '0'), style: mainStyle, textAlign: TextAlign.center),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: periodWidth,
                child: Text(period, style: mainStyle, textAlign: TextAlign.center, softWrap: false),
              ),
            ],
          ),

          // Row 4: Next values
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: hourWidth,
                child: Text(nextHour.toString().padLeft(2, '0'), style: fadedStyle, textAlign: TextAlign.center),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: minuteWidth,
                child: Text(nextMinute.toString().padLeft(2, '0'), style: fadedStyle, textAlign: TextAlign.center),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: periodWidth,
                child: belowPeriod.isNotEmpty
                    ? Text(belowPeriod, style: fadedStyle, textAlign: TextAlign.center, softWrap: false)
                    : SizedBox(),
              ),
            ],
          ),

          // Row 5: Down arrows
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: hourWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: _decreaseHour,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: minuteWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: _decreaseMinute,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: periodWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  onPressed: _togglePeriod,
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
