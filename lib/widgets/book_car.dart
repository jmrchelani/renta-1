import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:renta/pages/showroom.dart';
import 'package:renta/widgets/constants.dart';
import 'package:renta/widgets/data.dart';
import 'package:renta/widgets/dialogbox.dart';

class BookCar extends StatefulWidget {
  final Car car;

  BookCar({required this.car});

  @override
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {
  int _currentImage = 0;

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < widget.car.images.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: const BorderRadius.all(
          const Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(15),
                                      ),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.keyboard_arrow_left,
                                      color: Colors.black,
                                      size: 28,
                                    )),
                              ),
                              Row(
                                children: [
                                  Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(15),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.bookmark_border,
                                        color: Colors.white,
                                        size: 22,
                                      )),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.share,
                                        color: Colors.black,
                                        size: 22,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            widget.car.carName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            widget.car.model,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: Container(
                            child: PageView(
                              physics: const BouncingScrollPhysics(),
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentImage = page;
                                });
                              },
                              children: widget.car.images.map((path) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  child: Hero(
                                    tag: widget.car.model,
                                    child: Image.network(
                                      path,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        // widget.car.image.length > 1
                        //     ? Container(
                        //         margin:
                        //             const EdgeInsets.symmetric(vertical: 16),
                        //         height: 30,
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: buildPageIndicator(),
                        //         ),
                        //       )
                        //     : Container(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildPricePerPeriod(
                                "12",
                                widget.car.packages[0].outOfCity.toString(),
                                false,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              buildPricePerPeriod(
                                "6",
                                widget.car.packages[0].tenHours.toString(),
                                false,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              buildPricePerPeriod(
                                "1",
                                widget.car.packages[0].monthly.toString(),
                                false,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: const Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Text(
                          "SPECIFICATIONS",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        padding: const EdgeInsets.only(
                          top: 8,
                          left: 16,
                        ),
                        margin: const EdgeInsets.only(bottom: 16),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildSpecificationCar(
                                "Color", widget.car.color.toString()),
                            buildSpecificationCar("Gearbox", "Automatic"),
                            buildSpecificationCar("Seat", "4"),
                            buildSpecificationCar("Motor", "v10 2.0"),
                            buildSpecificationCar("Speed (0-100)", "3.2 sec"),
                            buildSpecificationCar("Top Speed", "121 mph"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 90,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "12 Month",
                  // ignore: unnecessary_const
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      widget.car.packages[0].outOfCity.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      "per month",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Book this car',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.push(
                              //   context,
                              //   // MaterialPageRoute(
                              //   //   builder: (context) => const DialogBox(),
                              //   ),
                              // );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  Widget buildPricePerPeriod(String months, String price, bool selected) {
    return Expanded(
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? kPrimaryColor : Colors.white,
          borderRadius: const BorderRadius.all(
            const Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.grey,
            width: selected ? 0 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              months + " Month",
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Text(
              price,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "USD",
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpecificationCar(String title, String data) {
    return Container(
      width: 130,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            data,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
