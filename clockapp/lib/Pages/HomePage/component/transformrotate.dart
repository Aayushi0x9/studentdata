import 'package:clockapp/headers.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

Widget transformRotate(
    {required d, required isStop, required controller, required Scale}) {
  return Transform.scale(
    scale: Scale,
    child: NeonCircularTimer(
      onComplete: () {
        isStop = true;
      },
      width: 200,
      controller: controller,
      duration: d.second,
      strokeWidth: 10,
      autoStart: true,
      neon: 4,
      isTimerTextShown: true,
      neumorphicEffect: true,
      outerStrokeColor: Colors.grey.shade100,
      innerFillGradient: LinearGradient(
          colors: [Colors.greenAccent.shade200, Colors.blueAccent.shade400]),
      neonGradient: LinearGradient(
          colors: [Colors.greenAccent.shade200, Colors.blueAccent.shade400]),
      strokeCap: StrokeCap.round,
      innerFillColor: Colors.black12,
      backgroudColor: Colors.grey.shade100,
      neonColor: Colors.blue.shade900,
    ),
  );
}
