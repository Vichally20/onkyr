import 'package:flutter/material.dart';
import 'package:onkyr/components/doctor_card.dart';

import 'package:onkyr/components/appointment_card.dart';
import '../utils/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Map<String,dynamic>> medCat =[
    {
      'icon':Icons.person_outline,
      'category':'General',
    },
    {
      'icon':Icons.monitor_heart,
      'category':'Cardiology',
    },
    {
      'icon':Icons.hearing_disabled,
      'category':'Respiration',
    },
    {
      'icon':Icons.back_hand_rounded,
      'category':'Dermatology',
    },
    {
      'icon':Icons.cable_outlined,
      'category':'Immunology',
    },
    {
      'icon':Icons.table_bar_outlined,
      'category':'Hematology',
    },

  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return  Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
          ),
        child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Abdulrasaq',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      // 1
                      SizedBox(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('asset/profile23.jpg'),
                        ),
                      )
                    ],
                  ),
                  Config.spaceSmall,

                  const Text('Category',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Config.spaceSmall,
                  SizedBox(
                    height: Config.heightSize * 0.05,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(medCat.length, (index) {
                        return Card(
                          margin: EdgeInsets.only(right: 20),
                          color: Config.primaryColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                   medCat[index]['icon'],
                                color: Colors.white
                                ),
                                Text(
                                  medCat[index]['category'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ),
                  Config.spaceSmall,
                  const Text(
                    'Appointment Today',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Config.spaceSmall,
                  const AppointmentCard(),
                  Config.spaceMedium,
                  const Text(
                    'Top Tests',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Config.spaceSmall,
                  Column(
                    children: List.generate(5, (index){
                      return const DoctorCard(route: 'stat_detail',);
                    }),
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}