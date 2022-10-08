import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController myControllerYas = TextEditingController();
  TextEditingController myControllerKilo = TextEditingController();
  TextEditingController myControllerUzunluk = TextEditingController();
  static double bmiCalculate(double kilo, double boy) {
    if (boy < 100 && kilo < 30) {
      return -1;
    }

    return (kilo / ((boy / 100) * (boy / 100)));
  }

  static String detail(double kilo, double boy) {
    double sonuc = bmiCalculate(kilo, boy);

    if (sonuc < 18.5) {
      return 'ideal kilonun altında';
    } else if (sonuc >= 18.5 && sonuc < 24.9) {
      return 'İdeal kiloda';
    } else if (sonuc >= 24.9 && sonuc < 29.5) {
      return 'İdeal kilonun üstünde';
    } else if (sonuc >= 29.5 && sonuc < 39.9) {
      return 'İdeal kilonun çok üstünde (obez)';
    } else if (sonuc >= 39.9) {
      return 'İdeal kilonun çok üstünde (morbid obez)';
    }
    return 'Hesaplanamadı';
  }

  static String images(double kilo, double boy) {
    double sonuc = bmiCalculate(kilo, boy);

    if (sonuc < 18.5) {
      return 'assets/underWeight.png';
    } else if (sonuc >= 18.5 && sonuc < 24.9) {
      return 'assets/normal.gif';
    } else if (sonuc >= 24.9 && sonuc < 29.5) {
      return 'assets/idealKiloUstu.gif';
    } else if (sonuc >= 29.5 && sonuc < 39.9) {
      return 'assets/obez.gif';
    } else if (sonuc >= 39.9) {
      return 'assets/morbidObez.gif';
    }
    return 'Hesaplanamadı';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myControllerKilo.dispose();
    myControllerUzunluk.dispose();
    myControllerYas.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                //color: Colors.amber,
                width: 250,
                height: 90,
                child: Text(
                  "Let's calculate\nyour current BMI",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('You can find out whether are'),
                      Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text('overweight, underweight or ideal weight.'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Colors.grey.shade500),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Female',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          alignment: Alignment.center,
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade500),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Text('Male',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Colors.grey.shade500),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Text('Other',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 30),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: myControllerYas,
                  // onChanged: (value) {
                  //   setState(() {
                  //     yas = double.parse(value);
                  //     print('yas $yas');
                  //   });
                  // },
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Age',
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey.shade400)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 30),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 3,

                  controller: myControllerUzunluk,
                  // onChanged: (value) {
                  //   setState(() {
                  //     height = double.parse(value);
                  //     print('height $height');
                  //   });
                  // },
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Height',
                      suffix: Text(
                        'cm',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey.shade400)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 30),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 3,

                  controller: myControllerKilo,
                  // onChanged: (value) {
                  //   setState(() {
                  //     weight = double.parse(value);
                  //     print('weight $weight');
                  //   });
                  // },
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Weight',
                      suffix: Text(
                        'kg',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      fillColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.grey.shade400)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170, right: 30),
                child: GestureDetector(
                  onTap: () {
                    // ort = weight / (height * height);
                    // print('ortalama: $ort');

                    String sonuc = bmiCalculate(
                            double.parse(myControllerKilo.text),
                            double.parse(myControllerUzunluk.text))
                        .toStringAsFixed(2);
                    String detay = detail(double.parse(myControllerKilo.text),
                        double.parse(myControllerUzunluk.text));
                    String image = images(double.parse(myControllerKilo.text),
                        double.parse(myControllerUzunluk.text));
                    /*   Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Ibm(
                          detay: detay,
                          sonuc: sonuc,
                          images: image,
                        ),
                      ),
                    ); */
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    alignment: Alignment.center,
                    width: 350,
                    height: 50,
                    child: const Text(
                      'Calculate BMI',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
