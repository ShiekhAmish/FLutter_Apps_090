import 'package:flutter/material.dart';
class PasswordsList extends StatefulWidget {
  const PasswordsList({Key key}) : super(key: key);

  @override
  _PasswordsListState createState() => _PasswordsListState();
}


  @override
  Widget build(BuildContext context) {
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
                        child: Text(storedocs[i]['email'],
                            style: TextStyle(fontSize: 18.0))),
                  ),
                  TableCell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Update(
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
}

