import '../../../../headers.dart';

Widget DetailData(
    {required size,
    required data,
    required headername,
    required String headeransvar}) {
  return Container(
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(5),
    width: size.width,
    height: size.height * 0.05,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          headername,
          style: const TextStyle(
            color: Colors.blueGrey,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
        Text(
          data[headeransvar],
          style: const TextStyle(
            color: Colors.blueGrey,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
