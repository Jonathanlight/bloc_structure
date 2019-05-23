import 'package:flutter/material.dart';
import 'Employee.dart';
import 'EmployeeBlock.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    _employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        centerTitle: true,
        title: Text("Devis Kernix", style: TextStyle(fontSize: 30.0, color: Colors.white),),
        elevation: 10.0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.employeeListStream,
          builder: (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "${snapshot.data[index].id}.",
                          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${snapshot.data[index].name}",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              "${snapshot.data[index].salary} €",
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_up),
                          color: Colors.green,
                          onPressed: (){
                            _employeeBloc.employeeSalaryIncrement.add(snapshot.data[index]);
                          },
                        ),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.thumb_down),
                          color: Colors.red,
                          onPressed: (){
                            _employeeBloc.employeeSalaryDecrement.add(snapshot.data[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}