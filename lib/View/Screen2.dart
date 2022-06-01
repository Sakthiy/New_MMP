import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mmp/Methods/post.dart';
import 'package:mmp/Services/Service1.dart';
import 'package:mmp/Services/service.dart';
import 'package:mmp/class/themeData.dart';

class MMP extends StatefulWidget {
  MMP({Key? key}) : super(key: key);

  @override
  State<MMP> createState() => _MMPState();
}

class _MMPState extends State<MMP> {
  List<Post> posts = [];
  List<Post> lstposts = [];
  List<Datum> lstDatum = [];
  late Post objPosts;
  var isLoaed = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    objPosts = (await RomoteService().getPost());
    //method 1:

    if (lstDatum != null) {
      setState(() {
        isLoaed = true;
        lstDatum = objPosts.data;
      });
    }
  }

// ------------------------------------------------------------------------

// ------------------------------------------------------------------------

  static const String imagesurl = "https://vegetablemarketprice.com/";
  bool on = false;
  String? value;
  final items = ['dsdfsh', 'cfdcgxs', 'fvfxsf', 'rgiyjshd'];
  List<DistrictName>? district;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    on = !on;
                  });
                },
                icon: Icon(on ? Icons.abc : Icons.menu)),
          ],
          backgroundColor: Colors.transparent,
          title: Text(
            'Vegetables',
            style: TextStyle(color: Themedata.main1C),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Visibility(
            visible: isLoaed,
            replacement: Center(child: CircularProgressIndicator()),
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: value,
                        isExpanded: true,
                        iconSize: 36,
                        icon: Icon(Icons.arrow_drop_down_rounded),
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(
                          () => this.value = value,
                        ),
                      ),
                    ),
                  ),
                ),
                on
                    ? Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: lstDatum.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                            // lstDatum[index].id.capi(),
                                            lstDatum[index]
                                                .vegetableName
                                                .substring(lstDatum[index]
                                                    .vegetableName
                                                    .indexOf('('))),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(6),
                                              bottomLeft: Radius.circular(6)),
                                          color: Colors.amber,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Text(
                                            'Price  ₹ ${lstDatum[index].price}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Image.network(
                                        imagesurl +
                                            lstDatum[index].table.imageUrl,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: lstDatum.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                leading: Image.network(imagesurl +
                                    '${lstDatum[index].table.imageUrl}'),
                                title: Center(
                                  child: Text(
                                    lstDatum[index].id.capi(),
                                    style: TextStyle(fontSize: 26),
                                  ),
                                ),
                                trailing: Text(
                                  '₹ ${lstDatum[index].price}',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
        ),
      );
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
