import 'package:budgetapp/Models%20/tarnsaction.dart';
import 'package:flutter/material.dart';
import 'package:budgetapp/common/color_constants.dart';
import 'package:budgetapp/json/budget_json.dart';
import 'package:budgetapp/json/day_month.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
/* refrenced from https://github.com/Kalpesh209/flutter_budget_tracking_app*/

class BudgetScreen extends StatefulWidget {
  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

var formatter = new DateFormat('dd');
var now = new DateTime.now();
String formattedDate = formatter.format(now);
String day = DateFormat('EEEE').format(now);

class _BudgetScreenState extends State<BudgetScreen> {
  int activeDay = 1;
  int date = int.parse(formattedDate);
  List<Map<String, dynamic>>? budget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: red.withOpacity(0.0005),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: grey,
              boxShadow: [
                BoxShadow(
                  color: black,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 65, right: 22, left: 22, bottom: 22),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Budget/Goals",
                        style: TextStyle(fontSize: 20, color: black),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 25,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(AntDesign.search1)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      months.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeDay = index;
                            });
                          },
                          child: Container(
                            width:
                                (MediaQuery.of(context).size.width - 40) / 10,
                            child: Column(
                              children: [
                                Text(
                                  months[index]['label'],
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: activeDay == index
                                          ? red
                                          : blue.withOpacity(0.09),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: activeDay == index
                                              ? red
                                              : blue.withOpacity(0.09))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, top: 7, bottom: 7),
                                    child: Text(
                                      months[index]['day'],
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: activeDay == index
                                              ? white
                                              : black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: List.generate(
                budget!.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: blue.withOpacity(0.1),
                            ),
                          ]),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                          top: 30,
                          right: 30,
                          bottom: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              budget![index]['type'],
                              style: TextStyle(
                                fontSize: 13,
                                color: black,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      budget![index]['amount'],
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
