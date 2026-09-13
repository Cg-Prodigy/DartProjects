import 'dart:io';
import 'dart:math';

void main() {
  var intValue = Random().nextInt(100) + 1;
  int trials = 10;
  while (true) {
    int? userinput = getUserInput();
    if (userinput != null) {
      if (userinput == intValue) {
        print("You guessed correct. The secret number is ${intValue}");
        break;
      } else {
        if (trials <= 1) {
          print("The secret number was ${intValue}");
          break;
        }
        print("Your guess is wrong try again.");
        if (intValue > userinput) {
          print("Hint: Guess higher");
        } else {
          print("Hint: Guess lower");
        }
        trials -= 1;
      }
    } else {
      print("Even after three tries no number was guessed. Bye");
      break;
    }
  }
}

int? getUserInput() {
  int trials = 3;
  while (trials >= 1) {
    print("Guess a number between 1 and 100:");
    String? userinput = stdin.readLineSync();
    if (userinput !=null && userinput.trim().isNotEmpty) {
      int? guess = int.tryParse(userinput!);
      if (guess != null) {
        return guess;
      } else {
        trials -= 1;
        print("Invalid type, try again. Trials remaining ${trials}");
      }
    } else {
      trials -= 1;
      print("Guess cannot be empty, try again. Trials remaining ${trials}");
    }
  }
  return null;
}
