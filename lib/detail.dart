import 'package:flutter/material.dart';

import 'calculate.dart';
import 'home.dart';

class Ibm extends StatefulWidget {
  const Ibm({
    super.key,
    required this.sonuc,
    required this.detay,
    required this.images,
  });
  final String sonuc, detay, images;
  @override
  State<Ibm> createState() => _IbmState();
}

class _IbmState extends State<Ibm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 100, right: 20, left: 20, bottom: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300.withOpacity(0.7),
                      offset: const Offset(0, 2),
                      blurRadius: 7,
                      spreadRadius: 10),
                ],
              ),
              padding: const EdgeInsets.all(20),
              // color: Colors.blueAccent.shade100,
              child: Column(
                children: [
                  const Text(
                    'Your BMI is',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      widget.sonuc == "-1.00"
                          ? "Uygun degerler giriniz !"
                          : widget.sonuc,
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      widget.sonuc == "-1.00" ? "" : widget.detay,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Image.asset(widget.images),

          // Image.asset("assets/overweight.gif"),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 50),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                alignment: Alignment.center,
                //width: 350,
                height: 50,
                child: const Text(
                  'Start over',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
