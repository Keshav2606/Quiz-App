import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: summaryData.map((data) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${(data['question_index'] as int) + 1}.'),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (data['question'] as String),
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (data['chosen_answer'] as String),
                    style: TextStyle(
                        color: data['answer'] == data['chosen_answer']
                            ? Colors.green
                            : Colors.red),
                  ),
                  Text(
                    (data['answer'] as String),
                    style: const TextStyle(color: Colors.blue),
                  )
                ],
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
