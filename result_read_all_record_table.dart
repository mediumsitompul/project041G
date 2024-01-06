import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_studentsid_search/help_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'data_model_table1.dart';
import 'main.dart';
import 'help_page.dart';

class ResultReadAllRecord extends StatelessWidget {
  const ResultReadAllRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(child: Text('CRUD OPERATION\n (READ ALL DATA)')),
        ),
        body: const MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var result;
  bool dataloaded = false;
  bool error = false;

  @override
  void initState() {
    _getData();
    // TODO: implement initState
    super.initState();
  }

  //===================================================================================

  void _getData() {
    Future.delayed(Duration.zero, () async {
      var url = Uri.parse(
          //"http://192.168.100.240:8087/crud_restapi/read_all.php?auth=kjgdkhdfldfguttedfgr");
          "https://mediumsitompul.com/crud_restapi/read_all.php?auth=kjgdkhdfldfguttedfgr");

      var response = await http.post(Uri.parse(url.toString()));
      if (response.statusCode == 200) {
        setState(() {
          result = json.decode(response.body);

          print("result ++++++++++++++++++++++++++++++++++++++++++++++++");
          print(result);

          dataloaded = true;
        });
      } else {
        setState(() {
          error = true;
        });
      }
    });
  }

  //===================================================================================

  Widget datalist() {
    if (result["error"] != null) {
      return Text(result["errmsg"]);
    } else {
      List<DataModel> namelist = List<DataModel>.from(result["data"].map((i) {
        return DataModel.fromJSON1(i);
      }));

      return ListView(
        children: [
          Table(
            border: TableBorder.all(width: 1, color: Colors.black45),
            children: namelist.map((dataModel) {
              return TableRow(children: [



                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage(
                      student_id1: dataModel.student_id1
                    ),));
                  },
                  child: TableCell(
                      child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(dataModel.student_id1))),
                ),

                TableCell(
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(dataModel.student_name1))),
                TableCell(
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(dataModel.major1))),
                TableCell(
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(dataModel.phone1))),
              ]);
            }).toList(),
          ),
        ],
      );
    }
  }
  //===================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //..................................................
      body: Container(
        padding: const EdgeInsets.all(15),
        child: dataloaded
            ? datalist()
            : const Center(child: CircularProgressIndicator()),
      ),
      //..................................................

      //................... floatingActionButton >>> IN SCAFFOLD() ................
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          print('Tombol Reffresh di pencettt');

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyApp(),
              ));
        }),
        tooltip: 'Reload data',
        child: Icon(Icons.ac_unit),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      //...........................................................................
    );
  }
}
