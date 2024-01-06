import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'read_1_record_notfound.dart';
import 'result_read_1_record.dart';



class HelpPage extends StatelessWidget {
  String student_id1;

  HelpPage({super.key, required this.student_id1});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: Center(child: Text("HELP PAGE")),),
      body: MyWidget(student_id1a: student_id1),
      ),
    );
  }
}



class MyWidget extends StatefulWidget {
  final String student_id1a;

  MyWidget({super.key, required this.student_id1a});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  var id1;
  var student_id1;
  var student_name1;
  var gender1;
  var address1;
  var major1;
  var phone1;
  var tuition_fee2;
  var datetime_entry2;




  Future<void> _querySearch1() async {
    final url1 =
        Uri.parse('https://mediumsitompul.com/crud_restapi/search1.php');
    var responseUniv = await http.post(url1, body: {
      "search1": widget.student_id1a,
    });
    final datastudent = jsonDecode(responseUniv.body);
    print(datastudent);

    if (datastudent.toString().isEmpty) {
      setState(() {
        print("Data Not Found");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Read1RecordNotFound(),
            ));
      });
    } else {
      if (datastudent[0]['id'] != null) {
        id1 = datastudent[0]['id'];
        student_id1 = datastudent[0]['student_id'];
        student_name1 = datastudent[0]['student_name'];
        gender1 = datastudent[0]['gender'];
        address1 = datastudent[0]['address'];
        major1 = datastudent[0]['major'];
        phone1 = datastudent[0]['phone'];

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultRead1Record(
                id1_: id1,
                student_id1_: student_id1,
                student_name1_: student_name1,
                gender1_: gender1,
                address1_: address1,
                major1_: major1,
                phone1_: phone1,
                datetime_entry2_: datetime_entry2.toString(),
              ),
            ));
      }
    }
  }

  @override
  void initState() {
    _querySearch1();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.student_id1a)
        ],
      ),
    );
  }
}
