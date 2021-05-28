import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final ammounController = TextEditingController();
  final Function _addTransaction;
  NewTransaction(this._addTransaction);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter the name of the transaction'),
            ),
            TextFormField(
              controller: ammounController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Ammount of the transaction'),
            ),
            TextButton.icon(
              onPressed: () {
                _addTransaction(
                    titleController.text, double.parse(ammounController.text));
              },
              icon: Icon(Icons.add),
              label: Text('Add a transaction'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
