import 'package:studentdata/headers.dart';

import '../../../utils/Global/global_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '👨🏼‍🎓 StudentData 👨🏼‍🎓',
          style: TextStyle(color: Colors.white, fontSize: 24, letterSpacing: 2),
        ),
        centerTitle: true,
        titleSpacing: 1,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.white60,
      body: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ListView.builder(
          itemCount: Globals.globals.StudentData.length,
          itemBuilder: (context, Name) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(Globals.globals.StudentData),
              ),
              title: Text('Car'),
              trailing: Icon(Icons.more_vert),
            );
          },
        ),
      ),
    );
  }
}
