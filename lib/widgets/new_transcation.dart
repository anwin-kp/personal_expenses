import 'package:flutter/material.dart';

class NewTranscation extends StatefulWidget {
  final Function addTX;

  NewTranscation(this.addTX);

  @override
  State<NewTranscation> createState() => _NewTranscationState();
}

class _NewTranscationState extends State<NewTranscation> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTX(
      titleController.text,
      double.parse(amountController.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //TextInput
      elevation: 10,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: (value) {
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            Container(
              //Add Transcation Button
              margin: EdgeInsets.only(top: 15),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  foregroundColor: Color.fromARGB(255, 80, 46, 46),
                  textStyle: TextStyle(fontSize: 18),
                  backgroundColor: Color.fromARGB(72, 255, 28, 28),
                  side: BorderSide(
                      color: Color.fromARGB(255, 255, 0, 0), width: 2),
                ),
                onPressed: submitData,
                child: Text(
                  'Add Transcation',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Color.fromARGB(255, 62, 62, 203),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
