import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_studentsid_search/create.dart';
import 'package:flutter_studentsid_search/pareto_major.dart';
import 'read_1_record.dart';
import 'read_1_recordupdate.dart';
import 'result_read_all_record_table.dart';
import 'read_1_recorddelete.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(child: Text('CRUD OPERATION')),
        ),
        body: NextPage_02_Pref(),
      ),
    );
  }
}

class NextPage_02_Pref extends StatefulWidget {
  const NextPage_02_Pref({Key? key}) : super(key: key);

  @override
  State<NextPage_02_Pref> createState() => _NextPagePrefState();
}

class _NextPagePrefState extends State<NextPage_02_Pref> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),

            const Text(
              " Main Menu CRUD",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(
              height: 40,
            ),

            //.....................................................................

            Padding(
              padding: const EdgeInsets.fromLTRB(2, 2, 200, 2),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const CreateData()));
                },
                child:Text(
                  '01. CREATE',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),

                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

              ),
            ),

            //.................................................................

            Padding(
              padding: const EdgeInsets.fromLTRB(2, 2, 200, 2),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Read1Record()));

                          
                },
                child: Text(
                  '02. READ     ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            //.................................................................
            //.................................................................

            Padding(
              padding: const EdgeInsets.fromLTRB(2, 2, 180, 2),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultReadAllRecord()));
                },
                child: Text(
                  '03. READ ALL  ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            //.................................................................

            Padding(
              padding: const EdgeInsets.fromLTRB(2, 2, 60, 2),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Major()));
                },
                child: Text(
                  '04. MAJOR SUMMARY PARETO',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            //.................................................................

            Padding(
              padding: const EdgeInsets.fromLTRB(2, 2, 200, 2),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Read1RecordUpdate()));
                },
                child: Text(
                  '05. UPDATE',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            //.................................................................

            Padding(
              padding: const EdgeInsets.fromLTRB(2, 2, 200, 2),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Read1RecordDelete()));
                },
                child: Text(
                  '06. DELETE',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),

            //.................................................................
          ],
        ),
      ),
    );
  }
}
