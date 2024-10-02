import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _darkTheme = false;
  Color _backgroundColor = Colors.white;
  final DateTime _currentDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Color checkboxColor = _darkTheme
        ? const Color.fromRGBO(255, 184, 112, 1.0)
        : const Color.fromRGBO(139, 80, 0, 1);
    return MaterialApp(
      home: Scaffold(
          backgroundColor: _backgroundColor,
          appBar: AppBar(
            title: Text('Todo',
                style: _darkTheme
                    ? const TextStyle(color: Colors.white)
                    : const TextStyle(color: Colors.black)),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    _darkTheme = !_darkTheme;
                    _backgroundColor = _darkTheme
                        ? Color.fromRGBO(31, 26, 21, 1)
                        : Colors.white;
                  });
                },
                icon: _darkTheme
                    ? const Icon(Icons.wb_sunny, color: Colors.white)
                    : const FaIcon(FontAwesomeIcons.moon, color: Colors.black),
              ),
              IconButton(
                onPressed: () {},
                icon: _darkTheme
                    ? const Icon(Icons.logout, color: Colors.white)
                    : const Icon(Icons.logout, color: Colors.black),
              ),
            ],
            backgroundColor: _backgroundColor,
          ),
          body: SingleChildScrollView(
            child: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(DateFormat('dd/MM/yyyy').format(_currentDate),
                        style: TextStyle(
                            fontSize: 15,
                            color: _darkTheme ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold))),
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 110,
                    child: ListView.separated(
                      itemCount: 30,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        DateTime date =
                            DateTime.now().add(Duration(days: index));
                        bool isSelected = _selectedDate.day == date.day &&
                            _selectedDate.month == date.month &&
                            _selectedDate.year == date.year;
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedDate = date;
                              });
                            },
                            child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                    color: isSelected
                                        ? _darkTheme
                                            ? Color.fromRGBO(255, 184, 112, 1.0)
                                            : Color.fromRGBO(139, 80, 0, 1)
                                        : _darkTheme
                                            ? Color.fromRGBO(31, 26, 21, 1)
                                            : Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: isSelected
                                          ? _darkTheme
                                              ? Color.fromRGBO(
                                                  255, 184, 112, 1.0)
                                              : Color.fromRGBO(139, 80, 0, 1)
                                          : _darkTheme
                                              ? Colors.white
                                              : Colors.white,
                                    )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat('dd').format(date),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: isSelected
                                              ? _darkTheme
                                                  ? Colors.black
                                                  : Colors.white
                                              : _darkTheme
                                                  ? Colors.white
                                                  : Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      DateFormat('E')
                                          .format(date)
                                          .toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: isSelected
                                              ? _darkTheme
                                                  ? Colors.black
                                                  : Colors.white
                                              : _darkTheme
                                                  ? Colors.white
                                                  : Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )));
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10);
                      },
                    )),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ActionChip(
                        onPressed: () {},
                        backgroundColor: _darkTheme
                            ? Color.fromRGBO(31, 26, 21, 1)
                            : Colors.white,
                        label: Text(
                          'Today',
                          style: TextStyle(
                              color: _darkTheme ? Colors.white : Colors.black,
                              fontSize: 15),
                        )),
                  ),
                  const Spacer(),
                  Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.navigate_before,
                          color: _darkTheme ? Colors.white : Colors.black,
                        )),
                    Text("Dec",
                        style: TextStyle(
                            color: _darkTheme ? Colors.white : Colors.black,
                            fontSize: 15)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.navigate_next,
                          color: _darkTheme ? Colors.white : Colors.black,
                        ))
                  ])
                ]),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      ListTile(
                        tileColor: _darkTheme ? Color.fromRGBO(45,37,28,1) : Color.fromRGBO(248,240,239,1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Text("first task",
                              style: TextStyle(
                                color: _darkTheme ? Colors.white : Colors.black,
                              )),
                          leading: Checkbox(
                              value: true,
                              onChanged: null,
                              fillColor:
                                  MaterialStateProperty.all(checkboxColor),
                              checkColor:
                                  _darkTheme ? Colors.black : Colors.white),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active,
                                color: _darkTheme ? Colors.white : Colors.black,
                              ))),
                      SizedBox(height: 15),
                      ListTile(
                          tileColor: _darkTheme ? Color.fromRGBO(45,37,28,1) : Color.fromRGBO(248,240,239,1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Text("second task",
                              style: TextStyle(
                                color: _darkTheme ? Colors.white : Colors.black,
                              )),
                          leading: Checkbox(
                              value: false,
                              onChanged: null,
                              fillColor: MaterialStateProperty.all(checkboxColor),
                              checkColor:
                              _darkTheme ? Colors.black : Colors.white),
                          )
                    ]))
              ],
            )),
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {},
              backgroundColor: _darkTheme
                  ? Color.fromRGBO(105, 60, 3, 1)
                  : Color.fromRGBO(255, 221, 190, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              label: Text(
                "New",
                style:
                    TextStyle(color: _darkTheme ? Colors.white : Colors.black),
              ),
              icon: Icon(Icons.add,
                  color: _darkTheme ? Colors.white : Colors.black))),
    );
  }
}
