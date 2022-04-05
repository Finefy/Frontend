import 'package:budgetapp/screens/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'numpad.dart';

class NumpadPage extends StatelessWidget {
  NumpadPage({Key? key, required Category category})
      : selected_category = category,
        super(key: key);
  final TextEditingController _myController = TextEditingController();
  final TextEditingController description = TextEditingController();
  Category selected_category;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // display the entered numbers
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: selected_category.icon),
              Text(
                selected_category.name.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        TextField(
          // style: TextStyle(),
          controller: description,
          // maxLines: 5,

          decoration: const InputDecoration(
              labelText: "Description",
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10)),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 70,
                child: Center(
                    child: TextField(
                  controller: _myController,
                  textAlign: TextAlign.center,
                  showCursor: false,
                  style: const TextStyle(fontSize: 40),
                  // Disable the default soft key board
                  keyboardType: TextInputType.none,
                )),
              ),
            ),
            // implement the custom NumPad
            NumPad(
              buttonSize: 75,
              buttonColor: Colors.purple,
              iconColor: Colors.deepOrange,
              controller: _myController,
              delete: () {
                _myController.text = _myController.text
                    .substring(0, _myController.text.length - 1);
              },
              // do something with the input numbers
              onSubmit: () {
                debugPrint('Your code: ${_myController.text}');
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          content: Text(
                            "You code is ${_myController.text}",
                            style: const TextStyle(fontSize: 30),
                          ),
                        ));
              },
            ),
          ],
        )
      ],
    );
  }
}
