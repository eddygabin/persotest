// ServeurQuestion.dart
import 'Question.dart';

List<Question> questions = [
  Question("Je me fais facilement des amis.", ["Pas du tout d’accord", "Pas d’accord", "Neutre", "D’accord", "Tout à fait d’accord"]),
  Question("J’ai beaucoup d’imagination.", ["Pas du tout d’accord", "Pas d’accord", "Neutre", "D’accord", "Tout à fait d’accord"]),
  Question("Je fais confiance aux autres.", ["Pas du tout d’accord", "Pas d’accord", "Neutre", "D’accord", "Tout à fait d’accord"]),
  Question("J’accomplis les tâches avec succès.", ["Pas du tout d’accord", "Pas d’accord", "Neutre", "D’accord", "Tout à fait d’accord"]),
  Question("Je me fâche facilement.", ["Pas du tout d’accord", "Pas d’accord", "Neutre", "D’accord", "Tout à fait d’accord"]),
  Question("J’apprécie beaucoup les grandes réceptions et réunions.", ["Pas du tout d’accord", "Pas d’accord", "Neutre", "D’accord", "Tout à fait d’accord"]),
  Question("Je trompe parfois les autres pour faire les choses comme je l'entends.", ["Pas du tout d’accord", "Pas d’accord", "Neutre", "D’accord", "Tout à fait d’accord"]),
  Question("Je n’aime pas le désordre. J’aime ranger.", ["Pas du tout d’accord", "Pas d’accord", "Neutre", "D’accord", "Tout à fait d’accord"]),
  Question("J’éprouve des émotions profondes et variées.", ["Pas du tout d’accord", "Pas d’accord", "Neutre", "D’accord", "Tout à fait d’accord"]),
  Question("J’adore aider les autres.", ["Pas du tout d’accord", "Pas d’accord", "Neutre", "D’accord", "Tout à fait d’accord"]),
  Question("Je tiens toujours mes promesses.", ["Pas du tout d’accord", "Pas d’accord", "Neutre", "D’accord", "Tout à fait d’accord"]),
  Question("Je préfère la diversité à la routine.", ["Pas du tout d’accord", "Pas d’accord", "Neutre", "D’accord", "Tout à fait d’accord"]),
];

double calculerScore(List<int> reponses) {
  if (reponses.length != questions.length) {
    throw Exception("Le nombre de réponses doit correspondre au nombre de questions.");
  }

  // Validation des scores
  for (var score in reponses) {
    if (score < 1 || score > 5) {
      throw Exception("Chaque réponse doit être un score entre 1 et 5.");
    }
  }

  int scoreTotal = 0;
  for (var score in reponses) {
    scoreTotal += score;
  }

  return scoreTotal / questions.length;
}

void afficherQuestions() {
  print("Bienvenue au test de personnalité. Répondez aux questions en sélectionnant un score de 1 à 5:");
  for (int i = 0; i < questions.length; i++) {
    print("\nQuestion \${i + 1}: \${questions[i].texte}");
    print("Choix: 1 - Pas du tout d’accord, 2 - Pas d’accord, 3 - Neutre, 4 - D’accord, 5 - Tout à fait d’accord");
  }
}

void afficherResultat(double score) {
  String evaluation;
  if (score < 2.5) {
    evaluation = "Votre score est faible. Vous pouvez vous améliorer.";
  } else if (score < 4) {
    evaluation = "Votre score est moyen. Bon travail !";
  } else {
    evaluation = "Excellent score ! Continuez comme ça !";
  }

  print("\nVotre score moyen est de : \$score");
  print(evaluation);
}

// Exemple d'utilisation
void main() {
  afficherQuestions();

  // Exemple de réponses données par l'utilisateur
  List<int> reponses = [5, 4, 3, 4, 2, 5, 3, 4, 5, 4, 5, 3];
  try {
    double scoreFinal = calculerScore(reponses);
    afficherResultat(scoreFinal);
  } catch (e) {
    print("Erreur : \${e.toString()}");
  }
}
