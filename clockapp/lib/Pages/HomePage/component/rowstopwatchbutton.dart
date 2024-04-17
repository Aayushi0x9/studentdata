import 'package:clockapp/headers.dart';
import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';

Widget buttonsthree({
  required size,
  required getsetstate,
  required isStop,
  required stopwatch,
  required hour,
  required minute,
  required second,
}) {
  return Row(
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
          width: size.width * 0.12,
          height: size.height * 0.05,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: NeonText(
            text: 'Start',
            textColor: Colors.black,
            textSize: 12,
            isSoftWrap: true,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          getsetstate(isStop = false);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          width: size.width * 0.12,
          height: size.height * 0.05,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: NeonText(
            text: 'Pause',
            textColor: Colors.black,
            textSize: 12,
            isSoftWrap: true,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          getsetstate(isStop = false);
          hour = minute = second = 0;
        },
        child: Container(
          padding: EdgeInsets.all(10),
          width: size.width * 0.12,
          height: size.height * 0.05,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: NeonText(
            text: 'Restart',
            textColor: Colors.black,
            textSize: 12,
            isSoftWrap: true,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
