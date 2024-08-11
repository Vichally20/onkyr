import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:onkyr/utils/config.dart';

// import '../utils/config.dart';

class PointmentPage extends StatefulWidget {
  const PointmentPage({super.key});

  @override
  State<PointmentPage> createState() => _PointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _PointmentPageState extends State<PointmentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      "doctor_name": "Prince Ebuka",
      "doctor_profile": "asset/profile23.jpg",
      "categories": "Dental",
      "status": FilterStatus.complete,
    },
    {
      "doctor_name": "james mcavoy",
      "doctor_profile": "asset/profile23.jpg",
      "categories": "General",
      "status": FilterStatus.upcoming,
    },
    {
      "doctor_name": "Mirabel Jones",
      "doctor_profile": "asset/profile23.jpg",
      "categories": "Cardiology",
      "status": FilterStatus.upcoming,
    },
    {
      "doctor_name": "Dame Doe",
      "doctor_profile": "asset/profile23.jpg",
      "categories": "Dermatology",
      "status": FilterStatus.cancel,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where(
      (var schedule) {
        // switch(schedule['status']){
        //   case 'upcoming':
        //   schedule['status'] = FilterStatus.upcoming;
        //   break;
        //   case 'complete':
        //   schedule['status'] = FilterStatus.complete;
        //   break;
        //   case 'cancel':
        //   schedule['status'] = FilterStatus.cancel;
        //   break;
        // }
        return schedule['status'] == status;
      },
    ).toList();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                // a container was used here
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFD6E8EE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                status = filterStatus;
                                switch (status) {
                                  case FilterStatus.upcoming:
                                    _alignment = Alignment.centerLeft;
                                    break;
                                  case FilterStatus.complete:
                                    _alignment = Alignment.center;
                                    break;
                                  case FilterStatus.cancel:
                                    _alignment = Alignment.centerRight;
                                    break;
                                }
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: status == filterStatus
                                    ? Config.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                filterStatus.toString().split('.').last,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: status == filterStatus
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            Config.spaceSmall,

            Expanded(child: ListView.builder(
              itemCount: filteredSchedules.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(filteredSchedules[index]['doctor_profile']),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                filteredSchedules[index]['doctor_name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Config.spaceXsmall,
                              Text(
                                filteredSchedules[index]['categories'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Config.secColor,
                                ),
                              ),
                            ],
                          ),
                      
                          //Config.spaceSmall,
                      
                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          //   decoration: BoxDecoration(
                          //     color: Colors.grey.withOpacity(0.2),
                          //     borderRadius: BorderRadius.circular(10),
                          //   ),
                          //   child: Text(
                          //     filteredSchedules[index]['status'].toString().split('.').last,
                          //     style: TextStyle(
                          //       color: Colors.grey,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Config.spaceSmall,
                       const ScheduleCard(),
                       Config.spaceSmall,
                        Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                          // const Expanded(
                          //   child: OutlinedButton(
                          //     onPressed: null,
                          //     child: Text(
                          //       'Cancel',
                          //       style: TextStyle(color: Config.secColor),
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Config.secColor),
                                  ),
                                ),
                              ),
                          const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Config.secColor,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Reschedule',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                         ],
                         ),
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0B2545),
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_today_outlined,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Tuesday, 03/08/2023',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm_outlined,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '2:00 PM',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
