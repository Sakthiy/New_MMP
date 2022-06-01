import 'package:flutter/material.dart';
import 'package:mmp/Methods/districtName.dart';
import 'package:mmp/Services/Service1.dart';
import 'package:mmp/View/Screen2.dart';
import 'package:mmp/class/themeData.dart';

class Screen1 extends StatefulWidget {
  Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<DistrictName>? district;
  var loaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDdata();
  }

  getDdata() async {
    district = await RomoteServices().getDistrictName();
    if (district != null) {
      setState(() {
        loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        endDrawer: _endDrawer(),
        appBar: AppBar(
          title: Text(
            Themedata.maintitle,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Text(
              'Selcte District ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: district?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.location_on_outlined,
                        color: Themedata.main1C,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Themedata.IconColor,
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MMP()));
                      },
                      title: Text('${district?[index].value.capi()}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
}

class _endDrawer extends StatelessWidget {
  const _endDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer();
}
