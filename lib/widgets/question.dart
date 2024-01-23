import 'package:flutter/material.dart';

Widget buildQuestion({
  required String questionText,
  required int? value,
  required ValueChanged<int?> onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        questionText,
        style: TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins"), // Adjust text style for better visibility
      ),
      SizedBox(height: 8.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRadioTile('Sangat Sering', 4, value, onChanged,
              Colors.red), // Customized RadioListTile
          buildRadioTile('Sering', 3, value, onChanged, Colors.orange),
          buildRadioTile('Jarang', 2, value, onChanged, Colors.yellow),
          buildRadioTile('Tidak Pernah', 1, value, onChanged, Colors.green),
        ],
      ),
    ],
  );
}

Widget buildRadioTile(String title, int radioValue, int? groupValue,
    ValueChanged<int?> onChanged, Color activeColor) {
  return RadioListTile<int>(
    title: Text(title,
        style: TextStyle(
            color: Colors.black)), // Adjust text color for better readability
    value: radioValue,
    groupValue: groupValue,
    onChanged: onChanged,
    activeColor:
        activeColor, // Set a distinct color for the selected radio button
    controlAffinity: ListTileControlAffinity
        .trailing, // Move the radio button to the right for a cleaner look
  );
}
