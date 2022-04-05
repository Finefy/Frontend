import 'package:budgetapp/screens/categories.dart';
import 'package:budgetapp/screens/numpad.dart';
import 'package:budgetapp/screens/numpad_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpensesIncome extends StatelessWidget {
  ExpensesIncome({Key? key}) : super(key: key);
  final TextEditingController _myController = TextEditingController();

  var categoryList = [
    Category(
      'food',
      Colors.white,
      const Icon(
        Icons.fastfood,
        size: 24.0,
        semanticLabel: 'Text to announce in accessibility modes',
      ),
    ),
    Category(
      'clothes',
      Colors.blueGrey,
      FaIcon(FontAwesomeIcons.shirt),
    ),
    Category(
      'bills',
      Colors.blueGrey,
      FaIcon(FontAwesomeIcons.wallet),
    ),
    Category(
      'home',
      Colors.blueGrey,
      FaIcon(FontAwesomeIcons.house),
    ),
    Category(
      'transport',
      Colors.blueGrey,
      FaIcon(FontAwesomeIcons.car),
    ),
    Category(
      'beauty',
      Colors.blueGrey,
      FaIcon(FontAwesomeIcons.mask),
    ),
    Category(
      'education',
      Colors.blueGrey,
      FaIcon(FontAwesomeIcons.book),
    ),
    Category(
      'entertainment',
      Colors.blueGrey,
      FaIcon(FontAwesomeIcons.gamepad),
    ),
    Category(
      'travel',
      Colors.blueGrey,
      FaIcon(FontAwesomeIcons.suitcase),
    ),
    Category(
      'health',
      Colors.blueGrey,
      FaIcon(FontAwesomeIcons.syringe),
    ),
    Category(
      'shopping',
      Colors.blueGrey,
      FaIcon(FontAwesomeIcons.bagShopping),
    ),
    Category(
      'insurance',
      Colors.blueGrey,
      FaIcon(FontAwesomeIcons.fileCirclePlus),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return
        // Column(
        // children: [
        Container(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (BuildContext context, int index) {
                return Column(children: <Widget>[
                  IconButton(
                    color: Colors.redAccent,
                    icon: categoryList[index].icon,
                    tooltip: categoryList[index].name,
                    onPressed: () {
                      //todo
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Scaffold(
                                    appBar: AppBar(
                                      title: const Text("Add Expense"),
                                      backgroundColor: Colors.purple.shade100,
                                    ),
                                    body: NumpadPage(
                                        category: categoryList[index]),
                                    backgroundColor: Colors.white,
                                  )));
                    },
                  ),
                  Text(categoryList[index].name)
                ]);
              },
            ))
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // display the entered numbers
        //     Padding(
        //       padding: const EdgeInsets.all(20),
        //       child: SizedBox(
        //         height: 70,
        //         child: Center(
        //             child: TextField(
        //           controller: _myController,
        //           textAlign: TextAlign.center,
        //           showCursor: false,
        //           style: const TextStyle(fontSize: 40),
        //           // Disable the default soft key board
        //           keyboardType: TextInputType.none,
        //         )),
        //       ),
        //     ),
        //     // implement the custom NumPad
        //     NumPad(
        //       buttonSize: 75,
        //       buttonColor: Colors.purple,
        //       iconColor: Colors.deepOrange,
        //       controller: _myController,
        //       delete: () {
        //         _myController.text = _myController.text
        //             .substring(0, _myController.text.length - 1);
        //       },
        //       // do something with the input numbers
        //       onSubmit: () {
        //         debugPrint('Your code: ${_myController.text}');
        //         showDialog(
        //             context: context,
        //             builder: (_) => AlertDialog(
        //                   content: Text(
        //                     "You code is ${_myController.text}",
        //                     style: const TextStyle(fontSize: 30),
        //                   ),
        //                 ));
        //       },
        //     ),
        //   ],
        // )
        // ],
        // )
        ;
  }
}
