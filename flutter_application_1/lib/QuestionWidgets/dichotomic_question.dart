import 'package:flutter/material.dart';
import '../QuestionClasses/question.dart';
import '../Log/profile_screen.dart';
import '../Log/log_page.dart';
import '../QuestionWidgets/questionnary.dart';

class DichotomicQuestion extends StatefulWidget {
  final String? question;
  final int? questionID;
  final List<String>? options;
  final List<int>? next;
  final List<Question>? listQuestions;

  const DichotomicQuestion({
    super.key,
    required this.question,
    required this.questionID,
    required this.options,
    required this.next,
    required this.listQuestions,
  });

  @override
  State<DichotomicQuestion> createState() => _DichotomicQuestionState();
}

class _DichotomicQuestionState extends State<DichotomicQuestion> {
  var answer = "";
  late int optionsIdx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 10,
              ),
              const Text(
                'QUIZZ',
                style: TextStyle(color: Color.fromRGBO(67, 12, 5, 1)),
              ),
              const SizedBox(
                width: 215,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(255, 0, 0, 0), width: 3),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(35.0))), //
                child: RawMaterialButton(
                  fillColor: const Color.fromRGBO(0, 53, 63, 1),
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
                  },
                  child: const Text("Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                ),
              )
            ],
          ),
          backgroundColor: const Color.fromRGBO(212, 111, 77, 1),
        ),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Dichotomic",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 161, 172),
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                const Text(
                  "this is the",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  widget.question!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 22.0),
                ...widget.options!
                    .map((option) => [
                          RadioListTile<String>(
                            value: option,
                            groupValue: answer,
                            title: Text(option),
                            onChanged: (v) => setState(() {
                              answer = v!;
                              optionsIdx = widget.options!.indexOf(option);
                            }),
                          )
                        ])
                    .expand((w) => w)
                    .toList(),
                const SizedBox(height: 22.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(0, 53, 63, 1), width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0))), //
                  child: RawMaterialButton(
                    fillColor: const Color.fromRGBO(212, 111, 77, 1),
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                    onPressed: () async {
                      switch (widget.next![optionsIdx]) {
                        case -1:
                          {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => widget
                                        .listQuestions!.last
                                        .createWidget(widget.listQuestions!)));
                          }
                          break;
                        case 0:
                          {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => widget
                                        .listQuestions![widget.questionID! + 1]
                                        .createWidget(widget.listQuestions!)));
                          }
                          break;
                        default:
                          {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => widget.listQuestions![
                                            widget.next![optionsIdx]]
                                        .createWidget(widget.listQuestions!)));
                          }
                          break;
                      }
                    },
                    child: const Text("SUBMIT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        )),
                  ),
                ),
                const SizedBox(height: 50.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromRGBO(255, 0, 0, 0), width: 3),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(35.0))), //
                  child: RawMaterialButton(
                    fillColor: const Color.fromRGBO(0, 53, 63, 1),
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LogPage()));
                    },
                    child: const Text("Log out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        )),
                  ),
                )
              ],
            ))));
  }
}


// Material(
//         child: Container(
//       margin: const EdgeInsets.all(15.0),
//       padding: const EdgeInsets.all(3.0),
//       child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               widget.question!,
//               style: const TextStyle(
//                 fontSize: 20,
//               ),
//             ),
//             ...widget.options!
//                 .map((option) => [
//                       RadioListTile<String>(
//                         value: option,
//                         groupValue: answer,
//                         title: Text(option),
//                         onChanged: (v) => setState(() {
//                           answer = v!;
//                           optionsIdx = widget.options!.indexOf(option);
//                         }),
//                       )
//                     ])
//                 .expand((w) => w)
//                 .toList(),
//             TextButton(
//               style: TextButton.styleFrom(
//                 backgroundColor: Colors.blueAccent,
//                 textStyle: const TextStyle(fontSize: 15),
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.all(10.0),
//               ),
//               onPressed: () async {
//                 switch (widget.next![optionsIdx]) {
//                   case -1:
//                     {
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(
//                           builder: (context) => widget.listQuestions!.last
//                               .createWidget(widget.listQuestions!)));
//                     }
//                     break;
//                   case 0:
//                     {
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(
//                           builder: (context) => widget
//                               .listQuestions![widget.questionID! + 1]
//                               .createWidget(widget.listQuestions!)));
//                     }
//                     break;
//                   default:
//                     {
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(
//                           builder: (context) => widget
//                               .listQuestions![widget.next![optionsIdx]]
//                               .createWidget(widget.listQuestions!)));
//                     }
//                     break;
//                 }
//               },
//               child: const Text('Submit'),
//             ),
//           ]),
//     ));