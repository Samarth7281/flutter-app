import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Container(
            width: double.infinity,
            child: Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/left_chev.svg',
                    height: 30,
                    width: 30,
                    color: Color(0xff0177f4),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Text(
                  'Home',
                  style: TextStyle(
                    color: Color(0xff039ae0),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            "Calendar 1",
            style: TextStyle(
              color: Color(0xffe2e2e2),
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          leadingWidth: 120, // Adjust this value as needed
          backgroundColor: Color(0xff232323),
        ),
        body: SingleChildScrollView(
          // Wrap content in SingleChildScrollView
          child: content(date),
        ),
      ),
    );
  }

  Widget content(DateTime date) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            focusedDay: date,
            lastDay: DateTime(2030, 3, 14),
            rowHeight: 43,
            calendarStyle: const CalendarStyle(
              defaultDecoration: BoxDecoration(),
              defaultTextStyle: TextStyle(color: Colors.white),
              weekendTextStyle: TextStyle(color: Colors.white),
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                  color: Colors.white), // Weekday (Mon-Fri) text color
              weekendStyle: TextStyle(
                  color: Colors.white), // Weekend (Sat-Sun) text color
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: true,
              formatButtonTextStyle:
                  TextStyle(color: Color(0xffd6350f)), // Center the title
              titleTextStyle: TextStyle(
                  color: Color(0xffd6350f)), // Header title text color
              decoration: BoxDecoration(
                color: Colors.black, // Header background color
              ),
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: Colors.red, // Left arrow color
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: Colors.red, // Right arrow color
              ), // Title text color
            ),
          ),
        ),
        //const SizedBox(height: 10),
        rowTemplate('Client Visit', '01:00 pm', 'assets/icons/tick.svg',
            0xFF094cb62, 'To Do List', true),
        rowTemplate('Project Plan', '03:00 pm', 'assets/icons/ham.svg',
            0xFFed9f02, 'View More', true),
        rowTemplate('Buy Grocery', 'Anytime', 'assets/icons/tick.svg',
            0xFF094cb62, 'To do List', true),
        rowTemplate('Call Electrician', 'Anytime', 'assets/icons/phone.svg',
            0xFF094cb62, '0421 046', false),
        rowTemplate('Email Supplier', 'Anytime', 'assets/icons/message.svg',
            0xFF0000FF, 'k@mail.com', false),
        rowTemplate2('Order supplies from vendor', 'assets/icons/cross.svg',
            0xFFed9f02, 'Not done'),
        rowTemplate2('Pay rent to Ray White prope', 'assets/icons/dollar.svg',
            0xFF94cb62, '2457')
      ],
    );
  }

  Widget rowTemplate(String eventName, String time, String icon, int color,
      String task, bool chevron) {
    return Container(
      color: Color(0xff232323),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex:
                      3, // Ensuring the event name takes the same amount of space
                  child: Text(
                    eventName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    time,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: Color(color),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2, // Task column takes the same amount of space
                  child: Text(
                    task,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                  ),
                ),
                const SizedBox(width: 20),
                chevron
                    ? SvgPicture.asset(
                        'assets/icons/arrow.svg',
                        width: 20,
                        height: 20,
                        color: Colors.white,
                      )
                    : const SizedBox(width: 20, height: 20)
              ],
            ),
          ),
          const Divider(
            // Adds a line after each row
            thickness: 1,
            color: Colors.grey,
            height: 0,
          ),
        ],
      ),
    );
  }

  Widget rowTemplate2(String eventName, String icon, int color, String task) {
    return Container(
      color: Color(0xff232323),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Same flex value for consistency with rowTemplate
                Text(
                  eventName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                  overflow: TextOverflow.ellipsis, // Prevent overflow
                ),

                const SizedBox(width: 45),
                SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: Color(color), // Same size for all icons
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1, // Same flex value for task text
                  child: Text(
                    task,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                  ),
                ),
                const SizedBox(width: 20),
                SvgPicture.asset(
                  'assets/icons/arrow.svg',
                  width: 20,
                  height: 20,
                  color: Colors.white, // Same size for arrow icon
                )
              ],
            ),
          ),
          const Divider(
            // Adds a line after each row
            thickness: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
