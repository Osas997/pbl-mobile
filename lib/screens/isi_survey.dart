import 'package:flutter/material.dart';
import 'package:survey_bullyng/screens/laporan_hasil.dart';

// void main() {
//   runApp(MaterialApp(
//     home: SurveyPage(),
//   ));
// }

class SurveyPage extends StatefulWidget {
  @override
  static const routeName = '/isi-survey';
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  List<String> questions = [
    'Apakah Anda pernah menjadi korban bullying?',
    'Apakah Anda pernah melihat bullying terjadi?',
    'Apakah Anda menyadari kasus bullying di sekitar Anda?',
    'Bagaimana sikap Anda terhadap kasus bullying?',
  ];

  List<int?> questionValues = List.filled(4, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey Bullying'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(questions.length, (index) {
            return buildQuestion(
              questionText: questions[index],
              value: questionValues[index],
              onChanged: (value) {
                setState(() {
                  questionValues[index] = value;
                });
              },
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (questionValues.contains(null)) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Peringatan'),
                  content: Text('Silakan lengkapi semua pertanyaan.'),
                  actions: [
                    TextButton(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            // Lakukan sesuatu dengan nilai jawaban
            // Misalnya, kirim jawaban ke server atau tampilkan hasilnya
            questionValues.forEach((value) {
              print('Jawaban: $value');
            });
            Navigator.of(context).pushNamed(
              LaporanHasil.routeName,
            );
          }
        },
        child: Icon(Icons.send),
      ),
    );
  }

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
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile<int>(
              title: Text('Sangat Sering'),
              value: 4,
              groupValue: value,
              onChanged: onChanged,
            ),
            RadioListTile<int>(
              title: Text('Sering'),
              value: 3,
              groupValue: value,
              onChanged: onChanged,
            ),
            RadioListTile<int>(
              title: Text('Jarang'),
              value: 2,
              groupValue: value,
              onChanged: onChanged,
            ),
            RadioListTile<int>(
              title: Text('Tidak Pernah'),
              value: 1,
              groupValue: value,
              onChanged: onChanged,
            ),
          ],
        ),
      ],
    );
  }
}
