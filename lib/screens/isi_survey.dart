import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:survey_bullyng/provider/murid_provider.dart';
import 'package:survey_bullyng/provider/pertanyaan_provider.dart';
import 'package:survey_bullyng/provider/survey_provider.dart';
import 'package:survey_bullyng/widgets/question.dart';

class SurveyPage extends StatelessWidget {
  static const routeName = '/isi-survey';
  const SurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey Bullying'),
      ),
      body: FutureBuilder(
        future: Provider.of<PertanyaanProvider>(context, listen: false)
            .getPertanyaan(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            EasyLoading.show(
              status: 'loading...',
            );
            return Container();
          } else if (snapshot.hasError) {
            // Error state
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            EasyLoading.dismiss();
            return SurveyForm();
          }
        },
      ),
    );
  }
}

class SurveyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pertanyaanProvider =
        Provider.of<PertanyaanProvider>(context, listen: false);
    final muridProvider = Provider.of<MuridProvider>(context, listen: false);

    print(muridProvider.murid.idSekolah);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(pertanyaanProvider.dataPertanyaan.length, (index) {
            return Consumer<SurveyProvider>(
              builder: (context, surveyProvider, child) {
                return buildQuestion(
                  questionText: pertanyaanProvider
                      .dataPertanyaan[index].pertanyaan
                      .toString(),
                  value: surveyProvider.survey[index]['skor'],
                  onChanged: (value) {
                    surveyProvider.isiSurvey(
                      idPertanyaan: pertanyaanProvider.dataPertanyaan[index].id
                          .toString(),
                      skor: value!,
                      tipePertanyaan: pertanyaanProvider
                          .dataPertanyaan[index].tipePertanyaan
                          .toString(),
                      index: index,
                    );
                  },
                );
              },
            );
          }).toList(),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Consumer<SurveyProvider>(
              builder: (context, surveyProvider, _) => Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool isAllQuestionsAnswered = surveyProvider.survey
                          .every((survey) => survey['skor'] != null);

                      if (isAllQuestionsAnswered) {
                        await surveyProvider.submitSurvey(
                            context, muridProvider.murid);
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Peringatan'),
                              content:
                                  Text('Silakan lengkapi semua pertanyaan.'),
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
                      }
                    },
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
