import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberWidget extends StatefulWidget {
  final Function verifyPhoneNumber;

  const PhoneNumberWidget(this.verifyPhoneNumber);

  @override
  _PhoneNumberWidgetState createState() => _PhoneNumberWidgetState(verifyPhoneNumber);
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  final textController = TextEditingController();
  final Function verifyPhoneNumber;

  _PhoneNumberWidgetState(this.verifyPhoneNumber);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: 300,
        child: TextFormField(
          autofocus: true,
          onChanged: (e) => verifyPhoneNumber(e),
          maxLength: 14,
          style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              counterText: "",
              // contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              hintText: "06 10 20 30 40"),
          controller: textController,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            CustomInputFormatter(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}

class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    text = text.replaceAll(RegExp(r'(\s)|(\D)'), '');

    int offset = newValue.selection.start;
    var subText = newValue.text.substring(0, offset).replaceAll(RegExp(r'(\s)|(\D)'), '');
    int realTrimOffset = subText.length;

    // if (newValue.selection.baseOffset == 0) {
    //   return newValue;
    // }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write(' '); // Replace this with anything you want to put after each 2 numbers

      }

      // This block is only executed once
      if (nonZeroIndex % 2 == 0 && subText.length == nonZeroIndex && nonZeroIndex > 2) {
        int moveCursorToRigth = nonZeroIndex ~/ 2 - 1;
        realTrimOffset += moveCursorToRigth;
      }

      // This block is only executed once
      if (nonZeroIndex % 2 != 0 && subText.length == nonZeroIndex) {
        int moveCursorToRigth = nonZeroIndex ~/ 2;
        realTrimOffset += moveCursorToRigth;
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(text: string, selection: new TextSelection.collapsed(offset: realTrimOffset));
  }
}
