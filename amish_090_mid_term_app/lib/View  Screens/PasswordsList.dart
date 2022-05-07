import 'package:flutter/material.dart';
import 'package:amish_090_mid_term_app/View  Screens/Update.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
class PasswordsList extends StatefulWidget {
  const PasswordsList({Key key}) : super(key: key);

  @override
  _PasswordsListState createState() => _PasswordsListState();
}

class _PasswordsListState extends State<PasswordsList> {
  final Stream<QuerySnapshot> studentsStream =
  FirebaseFirestore.instance.collection('students').snapshots();

  // For Deleting User
  CollectionReference students =
  FirebaseFirestore.instance.collection('students');
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return students
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)
    {
      if (snapshot.hasError) {
        print('Something went Wrong');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      final List storedocs = [];
      snapshot.data.docs.map((DocumentSnapshot document) {
        Map a = document.data() as Map<String, dynamic>;
        storedocs.add(a);
        a['id'] = document.id;
      }).toList();

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Table(
            border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              1: FixedColumnWidth(140),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  TableCell(
                    child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          'Actions',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              for (var i = 0; i < storedocs.length; i++) ...[
                TableRow(
                  children: [
                    TableCell(
                      child: Center(
                          child: Text(storedocs[i]['name'],
                              style: TextStyle(fontSize: 18.0))),
                    ),
                    TableCell(
                      child: Center(
                          child: Text(storedocs[i]['pass'],
                              style: TextStyle(fontSize: 18.0))),
                    ),
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () =>
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Update(
                                          id: storedocs[i]['id']),
                                ),
                              )
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.orange,
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                            {deleteUser(storedocs[i]['id'])},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      );
    }
    );
  }
}

