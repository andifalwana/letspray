
import 'package:lets_pray/screens/detail_doa.dart';
import 'package:lets_pray/screens/detail_bacaanshalat.dart';
import 'package:lets_pray/screens/detail_niat.dart';
import 'package:lets_pray/globals.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: 
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NiatSholat()));
                    },
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("assets/images/ic_niat.png"),
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Niat Sholat",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(height: 20, color: background),
              Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BacaanSholat()));
                    },
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("assets/images/ic_doa.png"),
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Bacaan Sholat",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(height: 20, color: background),
              Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AyatKursi()));
                    },
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("assets/images/ic_bacaan.png"),
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Ayat Kursi",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        
      ),
    );
  }
}