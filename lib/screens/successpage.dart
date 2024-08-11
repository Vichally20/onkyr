import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:onkyr/components/button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:onkyr/nwo/custom_bar.dart';
import '../utils/config.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Lottie.asset('asset/successlottie.json'),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Successfully Booked',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
              child: Button(
                  width: double.infinity,
                  title: 'Back to Homepage',
                  disable: false,
                  onpressed: ()=> Navigator.of(context).pushNamed('main'),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
