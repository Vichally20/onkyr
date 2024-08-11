import 'package:flutter/material.dart';

import '../utils/config.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({Key? key, required this.route}) : super(key: key);

  final String route;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(route);
        },
        child: Card(
          elevation: 5,
          color:  Color(0xFFF2F2F2),
          child: Row(
            children: [
              SizedBox(
          width: Config.widthSize * 0.33,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'asset/profile23.jpg',
              fit: BoxFit.cover,
            ),
          ),
              ),
              SizedBox(width: 10),
              Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
            'Dr mirabel jones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
                ),
                SizedBox(height: 5),
                Text(
            'Dental',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
                ),
                Spacer(),
                Row(
            children: [
              Icon(Icons.star, color: Colors.yellowAccent, size: 16),
              SizedBox(width: 5),
              Text('4.5'),
              SizedBox(width: 5),
              Text('Reviews'),
              SizedBox(width: 5),
              Text('20'),
            ],
                ),
              ],
            ),
          ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}