import 'package:flutter/material.dart';
import 'package:onkyr/errors/custom_appbar.dart';

import '../utils/config.dart';

class DomDetails extends StatefulWidget {
  const DomDetails({Key? key}) : super(key: key);

  @override
  State<DomDetails> createState() => _DomDetailsState();
}

class _DomDetailsState extends State<DomDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
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
          children: <Widget>[
            AboutDom(),
          ],
        ),
      ),
    );
  }
}

class AboutDom extends StatelessWidget {
  const AboutDom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const CircleAvatar(
            radius: 65,
            backgroundImage: AssetImage('asset/profile23.jpg'),
            backgroundColor: Colors.white,
          ),
          Config.spaceMedium,
          const Text(
            'Dr Abdulrasaq',
            style: TextStyle(
                fontSize: 24,
                color: Config.secColor,
                fontWeight: FontWeight.bold),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              "HHBMS (loreum ipsium avraeit segall oess oruth)",
              style: TextStyle(color: Colors.cyanAccent, fontSize: 15),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              "Just one big place",
              style: TextStyle(color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
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
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
        ],
      ),
    );
  }
}