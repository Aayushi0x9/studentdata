import '../../../../headers.dart';

Widget MyAppBar(
    {required dynamic Function() getSetState, required String title}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 24, letterSpacing: 2),
    ),
    centerTitle: true,
    titleSpacing: 1,
    backgroundColor: Colors.blueGrey,
    actions: [
      IconButton(
        onPressed: getSetState,
        icon: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
    ],
  );
}
