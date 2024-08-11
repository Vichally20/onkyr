import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onkyr/components/button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:onkyr/nwo/custom_bar.dart';
import '../utils/config.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  @override
  Widget build(BuildContext context) {
    Config();
    return Scaffold(
      appBar: CustomBar(
        appTitle: 'Appointment',
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _tableCalendar(),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 10,
                  ),
                  child: Center(
                    child: Text(
                      'Select Consultation Time',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
          _isWeekend ? SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 10,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'No Consultation on Weekends, Please select a weekday',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey
                    ),
                  ),
            ),
          ):SliverGrid(
            delegate: SliverChildBuilderDelegate( (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                    _timeSelected = true;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: _currentIndex == index
                            ? Colors.white
                            : Colors.black,
                    ),
                    color: _currentIndex == index
                        ? Config.primaryColor
                        : Config.secColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      ' ${index + 9}:00 ${index + 9 > 11 ? 'PM' : 'AM'}',
                      style: TextStyle(
                        color: _currentIndex == index
                            ? Colors.white
                            : null,
                         fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }, childCount: 8,
            ),
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 4,
            //  crossAxisSpacing: 10,
            //  mainAxisSpacing: 10,
             childAspectRatio: 1.5,
           ),
           ),
           SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 80, horizontal: 10),
              child: Button(
                width: double.infinity,
                title: 'Make Appointment',
                disable: _timeSelected && _dateSelected ? false : true,
                onpressed: (){
                  Navigator.of(context).pushNamed('successpage');
                },
              ),
            ),
           ),
        ],
      ),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2030, 3, 14),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Config.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        CalendarFormat.week: 'Week',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
          _currentDay = selectedDay;
          _dateSelected = true;
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }
}
