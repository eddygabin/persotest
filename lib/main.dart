// main.dart
import 'package:flutter/material.dart';
import 'ServeurQuestion.dart'; // Importer le fichier contenant la logique

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test de Personnalité',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QuestionScreen(),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  List<int> userResponses = [];

  void _nextQuestion(int score) {
    setState(() {
      userResponses.add(score);
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        _showResult();
      }
    });
  }

  void _showResult() {
    double finalScore = calculerScore(userResponses);
    String evaluation = "";

    if (finalScore < 2.5) {
      evaluation = "Votre score est faible. Vous pouvez vous améliorer.";
    } else if (finalScore < 4) {
      evaluation = "Votre score est moyen. Bon travail !";
    } else {
      evaluation = "Excellent score ! Continuez comme ça !";
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Résultat"),
        content: Text("Votre score moyen est de : $finalScore\n$evaluation"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                currentQuestionIndex = 0;
                userResponses = [];
              });
            },
            child: const Text("Recommencer"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test de Personnalité'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Question ${currentQuestionIndex + 1}: ${question.texte}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...question.reponses.asMap().entries.map((entry) {
              int index = entry.key;
              String choice = entry.value;
              return ElevatedButton(
                onPressed: () => _nextQuestion(index + 1),
                child: Text(choice),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
