import 'package:flutter/material.dart';

import '../utils/config.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic>schedules = [
    {
      "doctor_name": "Prince Ebuka",
      "doctor_profile": "asset/profile23.jpg",
      "categories": "Dental",
      "status": FilterStatus.complete
    },
    {
      "doctor_name": "Russ Castro",
      "doctor_profile": "asset/profile23.jpg",
      "categories": "General",
      "status": FilterStatus.cancel
    },
    {
      "doctor_name": "Mirabel Jones",
      "doctor_profile": "asset/profile23.jpg",
      "categories": "Cardiology",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Dame Doe",
      "doctor_profile": "asset/profile23.jpg",
      "categories": "Dermatology",
      "status": FilterStatus.cancel
    },
    {
      "doctor_name": "Moana Dirk",
      "doctor_profile": "asset/profile23.jpg",
      "categories": "General",
      "status": FilterStatus.upcoming
    },
    {
      "doctor_name": "Mayowa Adeyemi",
      "doctor_profile": "asset/profile23.jpg",
      "categories": "Respiration",
      "status": FilterStatus.complete
    },
  ];
  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      // switch (schedule['status']) {
      // case 'upcoming':
      //   schedule['status'] = FilterStatus.upcoming;
      //   break;
      //
      // case 'complete':
      //   schedule['status'] = FilterStatus.complete;
      //   break;
      //
      // case 'cancel':
      //   schedule['status'] = FilterStatus.cancel;
      //   break;
      // }
      return schedule['status'] == status;
    }).toList();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
            // up to this side the code works
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Config.secColor, // change to secondary collor@@
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //  filter for staus
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.complete) {
                                  status = FilterStatus.complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index) {
                  var schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Config.secColor, //try grey
                        ),
                        borderRadius: BorderRadius.circular(25)),
                    margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                               backgroundImage:
                                   AssetImage(schedule['doctor_profile']),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    schedule['doctor_name'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    schedule['category'],
                                    style: TextStyle(
                                      color: Colors.cyanAccent,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const ScheduleCard(),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedButton(
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
                                      backgroundColor: Config.secColor),
                                  onPressed: () {},
                                  child: const Text(
                                    'Reschedule',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
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
      // ignore: prefer_const_constructors
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //change the icons color
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
