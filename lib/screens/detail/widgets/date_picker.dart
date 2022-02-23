import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final weekList = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];
  final dayList = ["25", "26", "27", "28", "29", "30"];
  var selected = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () => setState(() => selected = index),
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 9),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: selected == index
                          ? Colors.grey.withOpacity(0.5)
                          : null),
                  child: Column(
                    children: [
                      Text(
                        weekList[index],
                        style: TextStyle(
                            color:
                                selected == index ? Colors.black : Colors.grey),
                      ),
                      SizedBox(height: 5),
                      Text(dayList[index],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: selected == index
                                  ? Colors.black
                                  : Colors.grey))
                    ],
                  ),
                ),
              ),
          separatorBuilder: (_, index) => SizedBox(width: 6),
          itemCount: weekList.length),
    );
  }
}
