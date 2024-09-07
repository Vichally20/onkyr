import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onkyr/components/button.dart';
import 'package:onkyr/nwo/custom_bar.dart';
import '../utils/config.dart';

class StatDetail extends StatefulWidget {
  const StatDetail({Key? key}) : super(key: key);

  @override
  _StatDetailState createState() => _StatDetailState();
}

class _StatDetailState extends State<StatDetail> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(
        appTitle: 'Test Details',
        icon: const Icon(Icons.arrow_back_ios_new),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            icon: Icon(
              isFav ? Icons.favorite_rounded : Icons.favorite_outline,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            AboutStat(),
            DetailBody(),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(10),
              child: Button(
                width: double.infinity,
                title: 'Book Appointment',
                disable: false,
                onpressed: () {
                  Navigator.of(context).pushNamed('booking');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutStat extends StatelessWidget {
  const AboutStat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 65,
            backgroundImage: AssetImage('asset/test1.png'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          const Text(
            'Complete Blood Count Testing',
            style: TextStyle(
              fontSize: 24,
              color: Config.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.spaceXsmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              "(Blood test analysis and evaluation)",
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceXsmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              "Hematology",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          StatInfo(),
          Config.spaceMedium,
          const Text(
            'Lab Test Info',
            style: TextStyle(
                color: Config.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          Config.spaceSmall,
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          ),
          // Add your widgets here
        ],
      ),
    );
  }
}

class StatInfo extends StatelessWidget {
  const StatInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        InfoCard(
          label: 'Lab Test',
          value: 'CBC +',
        ),
        SizedBox(width: 15),
        InfoCard(
          label: 'Price',
          value: 'N5000',
        ),
        SizedBox(width: 15),
        InfoCard(
          label: 'Duration',
          value: '2 days',
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                  color: Config.secColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            Config.spaceXsmall,
            Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
