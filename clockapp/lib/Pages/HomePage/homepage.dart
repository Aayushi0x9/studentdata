import 'dart:math';

import 'package:clockapp/headers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:neon_widgets/neon_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int hour = 00;
  int minute = 00;
  int second = 00;
  bool isStop = false;
  bool _isAnalog = false;
  bool _isStopWatch = false;
  bool _isDigital = true;
  bool _isStrap = false;
  bool _istimer = false;
  String _Second = "00";
  String _Minute = "00";
  String _Hour = "00";
  int s = 0;
  int m = 0;
  int h = 0;
  bool canRun = true;
  bool stop = false;

  List month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "July",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  List weekday = [
    "Mon",
    "Tues",
    "Wed",
    "Thur",
    "Fri",
    "Sat",
    "Sun",
  ];
  List laps = [];
  DateTime d = DateTime.now();
  void stopwatch() {
    isStop = true;
    Future.delayed(
      const Duration(milliseconds: 10),
      () {
        setState(() {
          if (isStop) {
            second++;
          }
          if (second > 59) {
            minute++;
            second = 0;
          }
          if (minute > 59) {
            hour++;
            minute = 0;
          }
          if (hour > 23) {
            hour = 0;
          }
          setState(() {
            minute = minute;
            hour = hour;
          });
        });
        if (isStop) {
          stopwatch();
          _Second = "$second";
          _Minute = "$minute";
          _Hour = "$hour";
        }
      },
    );
  }

  timer() {
    // stop = true;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        s--;
        // if (stop) {
        //   s--;
        // }
        if (s < 0) {
          m--;
          s = 59;
        }
        if (m == 0 && s == 0) {
          canRun = false;
        }
        if (canRun) {
          timer();
        }
      });
    });
  }

  void addLaps() {
    String lap = "$_Hour".toString().padLeft(2, "0") +
        " "
            ""
            ": " +
        "$_Minute".toString().padLeft(2, "0") +
        " : " +
        "$_Second".toString().padLeft(2, "0");
    setState(() {
      laps.add(lap);
    });
  }

  void AnalogStart() {
    Future.delayed(const Duration(seconds: 1), () {
      d = DateTime.now();
      setState(() {});
      AnalogStart();
    });
  }

  @override
  void initState() {
    super.initState();
    AnalogStart();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void getsetstate() {
      setState(() {});
    }

    final CountDownController controller = new CountDownController();

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Row(
        children: [
          Container(
            height: size.height,
            width: size.width * 0.15,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.dashboard_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
                IconButton(
                  onPressed: () {
                    _isAnalog = true;
                    _isDigital = false;
                    _istimer = false;
                    _isStopWatch = false;
                    _isStrap = false;
                    setState(() {});
                  },
                  icon: Icon(
                    CupertinoIcons.clock,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'AnalogClock',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                IconButton(
                  onPressed: () {
                    _isDigital = true;
                    _istimer = false;
                    _isStopWatch = false;
                    _isStrap = false;
                    _isAnalog = false;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.watch_outlined,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Digitalwatch',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                IconButton(
                  onPressed: () {
                    _istimer = true;
                    _isStopWatch = false;
                    _isStrap = false;
                    _isDigital = false;
                    _isAnalog = false;
                    setState(() {});
                  },
                  icon: Icon(
                    CupertinoIcons.timer,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Timer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                IconButton(
                  onPressed: () {
                    _isStopWatch = true;
                    _isStrap = false;

                    _isDigital = false;
                    _istimer = false;
                    _isAnalog = false;
                    setState(() {});
                  },
                  icon: Icon(
                    CupertinoIcons.stopwatch,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'StopWatch',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                IconButton(
                  onPressed: () {
                    _isStrap = true;
                    _isStopWatch = false;
                    _isDigital = false;
                    _istimer = false;
                    _isAnalog = false;
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.waves_outlined,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'StrapClock',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Transform.rotate(
            angle: pi,
            child: NeonLine(
              spreadColor: Colors.white,
              lightSpreadRadius: 0.5,
              lightBlurRadius: 0.5,
              lineWidth: 1,
              lineHeight: double.infinity,
              lineColor: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.only(right: 10, left: 16, top: 43, bottom: 10),
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NeonText(
                    text: "Clock",
                    spreadColor: Colors.white,
                    letterSpacing: 3,
                    blurRadius: 1,
                    textSize: 35,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: size.height * 0.3),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Visibility(
                        visible: _isAnalog,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(16),
                                    height: size.height * 0.6,
                                    child: Transform.rotate(
                                      angle: pi / 2,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        alignment: Alignment.center,
                                        height: size.height * 6,
                                        width: size.width,
                                        decoration: const BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 18,
                                              offset: Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: [
                                            ...List.generate(
                                              60,
                                              (index) => Transform.rotate(
                                                angle: index * (pi * 2) / 60,
                                                child: Divider(
                                                    endIndent: index % 5 == 0
                                                        ? size.width * 0.67
                                                        : size.width * 0.88,
                                                    thickness:
                                                        index % 5 == 0 ? 7 : 2,
                                                    color: index % 15 == 0
                                                        ? Colors.red
                                                        : Colors.white),
                                              ),
                                            ),
                                            // hour :----------
                                            Transform.rotate(
                                              angle: d.hour * (pi * 2) / 12,
                                              child: Divider(
                                                indent: 50,
                                                endIndent:
                                                    size.width * 0.39 - 23,
                                                thickness: 5,
                                                color: Colors.white,
                                              ),
                                            ),
                                            //minute :---------
                                            Transform.rotate(
                                              angle: d.minute * (pi * 2) / 60,
                                              child: Divider(
                                                indent: 40,
                                                endIndent:
                                                    size.width * 0.39 - 23,
                                                thickness: 3,
                                                color: Colors.white,
                                              ),
                                            ),

                                            //seconds :------------
                                            Transform.rotate(
                                              angle: d.second * (pi * 2) / 60,
                                              child: Divider(
                                                indent: 35,
                                                endIndent:
                                                    size.width * 0.39 - 23,
                                                thickness: 2,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //Strap
                      Visibility(
                        visible: _isStrap,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Transform.scale(
                                  scale: 1.45,
                                  child: NeonCircularTimer(
                                    onComplete: () {
                                      isStop = false;
                                    },
                                    width: 200,
                                    controller: controller,
                                    duration: d.second % 60,
                                    strokeWidth: 10,
                                    autoStart: true,
                                    neon: 4,
                                    neumorphicEffect: true,
                                    outerStrokeColor: Colors.grey.shade100,
                                    innerFillGradient: LinearGradient(colors: [
                                      Colors.greenAccent.shade200,
                                      Colors.blueAccent.shade400
                                    ]),
                                    neonGradient: LinearGradient(colors: [
                                      Colors.greenAccent.shade200,
                                      Colors.blueAccent.shade400
                                    ]),
                                    strokeCap: StrokeCap.round,
                                    innerFillColor: Colors.black12,
                                    backgroudColor: Colors.grey.shade100,
                                    neonColor: Colors.blue.shade900,
                                  ),
                                ),
                                Transform.scale(
                                  scale: 1.15,
                                  child: NeonCircularTimer(
                                    onComplete: () {
                                      isStop = true;
                                    },
                                    width: 200,
                                    controller: controller,
                                    duration: d.minute % 60,
                                    strokeWidth: 10,
                                    autoStart: true,
                                    neon: d.minute / 60,
                                    neumorphicEffect: true,
                                    outerStrokeColor: Colors.grey.shade100,
                                    innerFillGradient: LinearGradient(colors: [
                                      Colors.greenAccent.shade200,
                                      Colors.blueAccent.shade400
                                    ]),
                                    neonGradient: LinearGradient(colors: [
                                      Colors.greenAccent.shade200,
                                      Colors.blueAccent.shade400
                                    ]),
                                    strokeCap: StrokeCap.round,
                                    innerFillColor: Colors.black12,
                                    backgroudColor: Colors.grey.shade100,
                                    neonColor: Colors.blue.shade900,
                                  ),
                                ),
                                Transform.scale(
                                  scale: 0.8,
                                  child: NeonCircularTimer(
                                    onComplete: () {
                                      isStop = true;
                                    },
                                    width: 200,
                                    controller: controller,
                                    duration: d.hour % 12,
                                    strokeWidth: 10,
                                    autoStart: true,
                                    neon: d.hour / 12,
                                    neumorphicEffect: true,
                                    outerStrokeColor: Colors.grey.shade100,
                                    innerFillGradient: LinearGradient(colors: [
                                      Colors.greenAccent.shade200,
                                      Colors.blueAccent.shade400
                                    ]),
                                    neonGradient: LinearGradient(colors: [
                                      Colors.greenAccent.shade200,
                                      Colors.blueAccent.shade400
                                    ]),
                                    strokeCap: StrokeCap.round,
                                    innerFillColor: Colors.black12,
                                    backgroudColor: Colors.grey.shade100,
                                    neonColor: Colors.blue.shade900,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //Stopwatch
                      Visibility(
                        visible: _isStopWatch,
                        child: Column(
                          children: [
                            Center(
                              child: Row(
                                children: [
                                  NeonContainer(
                                    height: size.height * 0.08,
                                    width: size.width * 0.18,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(10),
                                    borderWidth: 2,
                                    spreadColor: Colors.white,
                                    lightSpreadRadius: 2,
                                    lightBlurRadius: 2,
                                    borderRadius: BorderRadius.circular(10),
                                    containerColor: Colors.black,
                                    child: NeonText(
                                      text:
                                          "${hour.toString().padLeft(2, '0')}",
                                      fontStyle: FontStyle.normal,
                                      spreadColor: Colors.white,
                                      letterSpacing: 3,
                                      blurRadius: 1,
                                      textSize: 30,
                                      textColor: Colors.white,
                                    ),
                                  ),
                                  NeonText(
                                    text: ": ",
                                    textSize: 40,
                                  ),
                                  NeonContainer(
                                    height: size.height * 0.08,
                                    width: size.width * 0.18,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    borderWidth: 2,
                                    borderRadius: BorderRadius.circular(10),
                                    spreadColor: Colors.white,
                                    lightSpreadRadius: 2,
                                    lightBlurRadius: 2,
                                    containerColor: Colors.black,
                                    child: NeonText(
                                      text:
                                          "${minute.toString().padLeft(2, '0')}",
                                      fontStyle: FontStyle.normal,
                                      spreadColor: Colors.white,
                                      letterSpacing: 3,
                                      blurRadius: 1,
                                      textSize: 30,
                                      textColor: Colors.white,
                                    ),
                                  ),
                                  NeonText(
                                    text: ": ",
                                    textSize: 40,
                                  ),
                                  NeonContainer(
                                    height: size.height * 0.08,
                                    width: size.width * 0.18,
                                    margin: EdgeInsets.all(10),
                                    padding: EdgeInsets.all(10),
                                    borderRadius: BorderRadius.circular(10),
                                    borderWidth: 2,
                                    spreadColor: Colors.white,
                                    lightSpreadRadius: 2,
                                    lightBlurRadius: 2,
                                    containerColor: Colors.black,
                                    child: NeonText(
                                      text:
                                          "${second.toString().padLeft(2, '0')}",
                                      fontStyle: FontStyle.normal,
                                      spreadColor: Colors.white,
                                      letterSpacing: 3,
                                      blurRadius: 1,
                                      textSize: 30,
                                      textColor: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (!isStop) {
                                      stopwatch();
                                    }
                                    getsetstate();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: size.width * 0.17,
                                    height: size.height * 0.05,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: NeonText(
                                      text: 'Start',
                                      spreadColor: Colors.white,
                                      letterSpacing: 1,
                                      textColor: Colors.black,
                                      textSize: 15,
                                      isSoftWrap: true,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    addLaps();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: size.width * 0.17,
                                    height: size.height * 0.05,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: NeonText(
                                      text: ' 🏴 ',
                                      textColor: Colors.black,
                                      spreadColor: Colors.white,
                                      letterSpacing: 1,
                                      textSize: 15,
                                      isSoftWrap: true,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isStop = false;
                                      laps.clear();
                                    });
                                    hour = minute = second = 0;
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: size.width * 0.17,
                                    height: size.height * 0.05,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: NeonText(
                                      text: 'Restart',
                                      spreadColor: Colors.white,
                                      letterSpacing: 1,
                                      textColor: Colors.black,
                                      textSize: 15,
                                      isSoftWrap: true,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 150,
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: laps.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Lap ${index + 1}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          " ${laps[index]}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              // color: Colors.white,
                              // child:
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                      //Digital
                      Visibility(
                        visible: _isDigital,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.15,
                                  ),
                                  NeonText(
                                    text:
                                        "${(d.hour % 12).toString().padLeft(2, '0')} : ${d.minute.toString().padLeft(2, '0')}",
                                    textSize: 50,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                    spreadColor: Colors.white,
                                    isSoftWrap: true,
                                    blurRadius: 2,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  NeonText(
                                      text: d.hour < 12 ? 'AM' : 'PM',
                                      textSize: 20,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1,
                                      spreadColor: Colors.white,
                                      isSoftWrap: true,
                                      blurRadius: 2),
                                  Spacer(),
                                ],
                              ),
                            ),
                            NeonText(
                              text:
                                  "${weekday[d.weekday - 1]}, ${d.day.toString().padLeft(2, '0')} ${month[d.month - 1]}",
                              isSoftWrap: true,
                              textSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              spreadColor: Colors.white,
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      //Timer
                      Visibility(
                        visible: _istimer,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "$m : $s",
                              style: const TextStyle(
                                fontSize: 55,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            NeonText(
                              text: '    Hour         Minute       Second',
                              isSoftWrap: true,
                              textSize: 20,
                              letterSpacing: 1,
                            ),
                            Row(
                              children: [
                                NeonContainer(
                                  margin: EdgeInsets.all(10),
                                  height: size.height * 0.2,
                                  width: size.width * 0.18,
                                  alignment: Alignment.center,
                                  borderWidth: 2,
                                  spreadColor: Colors.white,
                                  lightSpreadRadius: 2,
                                  lightBlurRadius: 2,
                                  borderRadius: BorderRadius.circular(10),
                                  containerColor: Colors.black,
                                  child: ListWheelScrollView(
                                      itemExtent: 30,
                                      useMagnifier: true,
                                      magnification: 2.5,
                                      diameterRatio: 1,
                                      onSelectedItemChanged: (index) {
                                        setState(() {
                                          h = index;
                                        });
                                      },
                                      children: List.generate(
                                        24,
                                        (index) => NeonText(
                                          text: "$index",
                                          blurRadius: 2,
                                          isSoftWrap: true,
                                        ),
                                      )),
                                ),
                                NeonText(
                                  text: ': ',
                                  isSoftWrap: true,
                                  textSize: 40,
                                ),
                                NeonContainer(
                                  margin: EdgeInsets.all(10),
                                  height: size.height * 0.2,
                                  width: size.width * 0.18,
                                  alignment: Alignment.center,
                                  borderWidth: 2,
                                  spreadColor: Colors.white,
                                  lightSpreadRadius: 2,
                                  lightBlurRadius: 2,
                                  borderRadius: BorderRadius.circular(10),
                                  containerColor: Colors.black,
                                  child: ListWheelScrollView(
                                      itemExtent: 30,
                                      useMagnifier: true,
                                      magnification: 2.5,
                                      diameterRatio: 1,
                                      onSelectedItemChanged: (index) {
                                        setState(() {
                                          m = index;
                                        });
                                      },
                                      children: List.generate(
                                        60,
                                        (index) => NeonText(
                                          text: "$index",
                                          blurRadius: 2,
                                          isSoftWrap: true,
                                        ),
                                      )),
                                ),
                                NeonText(
                                  text: ': ',
                                  isSoftWrap: true,
                                  textSize: 40,
                                ),
                                NeonContainer(
                                  margin: EdgeInsets.all(10),
                                  height: size.height * 0.2,
                                  width: size.width * 0.18,
                                  alignment: Alignment.center,
                                  borderWidth: 2,
                                  spreadColor: Colors.white,
                                  lightSpreadRadius: 2,
                                  lightBlurRadius: 2,
                                  borderRadius: BorderRadius.circular(10),
                                  containerColor: Colors.black,
                                  child: ListWheelScrollView(
                                    itemExtent: 30,
                                    useMagnifier: true,
                                    magnification: 2.5,
                                    diameterRatio: 1,
                                    onSelectedItemChanged: (index) {
                                      setState(() {
                                        s = index;
                                      });
                                    },
                                    children: List.generate(
                                      60,
                                      (index) => NeonText(
                                        text: "$index",
                                        blurRadius: 2,
                                        isSoftWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  timer();
                                });
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        timer();
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      width: size.width * 0.17,
                                      height: size.height * 0.05,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: NeonText(
                                        text: 'Start',
                                        spreadColor: Colors.white,
                                        letterSpacing: 1,
                                        textColor: Colors.black,
                                        textSize: 15,
                                        isSoftWrap: true,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        m = 0;
                                        s = 0;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10),
                                      width: size.width * 0.17,
                                      height: size.height * 0.05,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: NeonText(
                                        text: 'Reset',
                                        spreadColor: Colors.white,
                                        letterSpacing: 1,
                                        textColor: Colors.black,
                                        textSize: 15,
                                        isSoftWrap: true,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
