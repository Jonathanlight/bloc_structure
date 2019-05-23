//TODO: Imports
import 'dart:async';
import 'Employee.dart';

class EmployeeBloc {

  //TODO: List of employees
  List<Employee> _employeeList = [
    Employee(1, "Cinematcher", 530000.00),
    Employee(2, "FVP", 354000.99),
    Employee(3, "Phiadvisor", 250000.00),
    Employee(4, "CEMEA", 140000.99),
    Employee(5, "Epex-webshop", 840000.00),
    Employee(6, "Nowengo", 410000.00),
    Employee(7, "Nunshen", 230010.00),
    Employee(8, "Plusdepoints", 200000.00),
    Employee(9, "Bmused", 190000.00),
    Employee(10, "Xpressrent", 460000.99),
  ];

  //TODO: Stream controllers
  final _employeeListStreamController = StreamController<List<Employee>>();

  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  //TODO: Stream Sink getter
  Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;

  StreamSink<List<Employee>> get employeeListSink => _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement => _employeeSalaryIncrementStreamController.sink;
  StreamSink<Employee> get employeeSalaryDecrement => _employeeSalaryDecrementStreamController.sink;


  //TODO: Constructor - add data; listen to changes
  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);

    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  //TODO: Core functions
  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double increlentedSalary = salary * 20/100;
    _employeeList[employee.id -1].salary = ((salary + increlentedSalary) *100).round() / 100;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrelentedSalary = salary * 20/100;
    _employeeList[employee.id -1].salary = ((salary - decrelentedSalary) * 100).round() / 100;
    employeeListSink.add(_employeeList);
  }

  //TODO: dispose
  void dispose() {
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
    _employeeListStreamController.close();
  }

}


