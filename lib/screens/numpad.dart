import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// KeyPad widget
// This widget is reusable and its buttons are customizable (color, size)

class NumPad extends StatelessWidget {
  final double buttonSize;
  final Color buttonColor;
  final Color iconColor;
  final TextEditingController controller;
  final Function delete;
  final Function onSubmit;
  DateTime selectedDate = DateTime(2022);
  TextEditingController _dateController = TextEditingController();

  NumPad({
    Key? key,
    this.buttonSize = 70,
    this.buttonColor = Colors.indigo,
    this.iconColor = Colors.amber,
    required this.delete,
    required this.onSubmit,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // implement the number keys (from 0 to 9) with the NumberButton widget
            // the NumberButton widget is defined in the bottom of this file
            children: [
              NumberButton(
                number: 1,
                controller: controller,
              ),
              NumberButton(
                number: 2,
                controller: controller,
              ),
              NumberButton(
                number: 3,
                controller: controller,
              ),
              DateSelect()
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 4,
                controller: controller,
              ),
              NumberButton(
                number: 5,
                controller: controller,
              ),
              NumberButton(
                number: 6,
                controller: controller,
              ),
              SizedBox(
                width: 27,
                height: 70,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    side: const BorderSide(color: Colors.lightBlue),
                  ),
                  onPressed: () {
                    controller.text += "+";
                  },
                  child: const Center(
                    child: Text(
                      "+",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 27,
                height: 70,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    side: const BorderSide(color: Colors.lightBlue),
                  ),
                  onPressed: () {
                    controller.text += "-";
                  },
                  child: const Center(
                    child: Text(
                      "-",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 7,
                controller: controller,
              ),
              NumberButton(
                number: 8,
                controller: controller,
              ),
              NumberButton(
                number: 9,
                controller: controller,
              ),
              SizedBox(
                width: 70,
                height: 70,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    side: const BorderSide(color: Colors.lightBlue),
                  ),
                  onPressed: () {
                    // calculate the whole expression.
                    String exp = controller.text;
                    double res = 0.00;
                    exp.split(RegExp(r"\+|\-")).forEach((element) {
                      res += double.parse(element);
                    });
                    controller.text = res.toStringAsFixed(2);
                  },
                  child: const Center(
                    child: Text(
                      "=",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // this button is used to delete the last number
              // IconButton(
              //   onPressed: () => delete(),
              //   icon: Icon(
              //     Icons.backspace,
              //     color: iconColor,
              //   ),
              //   iconSize: 50,
              // ),
              SizedBox(
                width: 70,
                height: 70,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                    side: const BorderSide(color: Colors.lightBlue),
                  ),
                  onPressed: () {
                    // insert decimal in amount.
                    controller.text += ".";
                  },
                  child: const Center(
                    child: Text(
                      ".",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30),
                    ),
                  ),
                ),
              ),
              NumberButton(
                number: 0,
                controller: controller,
              ),
              // this button is used to submit the entered value
              // IconButton(
              //   onPressed: () => onSubmit(),
              //   icon: Icon(
              //     Icons.done_rounded,
              //     color: iconColor,
              //   ),
              //   iconSize: 50,
              // ),
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: IconButton(
                        onPressed: () => delete(),
                        icon: const Icon(
                          Icons.backspace,
                          color: Colors.red,
                        ),
                        iconSize: 30,
                      ))),
              SizedBox(
                  width: 70,
                  height: 70,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: IconButton(
                        onPressed: () => onSubmit(),
                        icon: const Icon(
                          Icons.done_rounded,
                          color: Colors.green,
                        ),
                        iconSize: 30,
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}

// define NumberButton widget
// its shape is round
class NumberButton extends StatelessWidget {
  final int number;
  static const double size = 70;
  // static final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          side: const BorderSide(color: Colors.lightBlue),
        ),
        onPressed: () {
          controller.text += number.toString();
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
               color: Colors.blue, fontSize: 30),
          ), //
        ),
      ),
    );
  }
}

class DateSelect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DateSelectState();
  }
}

class _DateSelectState extends State<DateSelect> {
  String cur = "05 03\n2022";
  void setDate(String newDate) {
    setState(() {
      cur = newDate;
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2022),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setDate(DateFormat("d M\ny").format(picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          side: const BorderSide(color: Colors.lightBlue),
        ),
        onPressed: () {
          _selectDate(context);
        },
        child: Center(
          child: Text(
            cur,
            style: const TextStyle(
                color: Colors.blue, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
