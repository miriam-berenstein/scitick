import 'package:final_project_3/models/basic_question.dart';
import 'package:final_project_3/services/board_service.dart';
import 'package:final_project_3/services/questions/questions_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_board.g.dart';

@JsonSerializable()
class GameBoard {
  static final QuestionsService _questionsServices = QuestionsService();
  static final BoardService _boardService = BoardService();
  late String id;
  final String grade;
  final int numOfQuestions;
  List<BasicQuestion> questions;
  int currentQuestion;
  int numOfMoves;
  List<bool> answered;
  final int goldStickers;
  final int silverStickers;

  GameBoard({
    required this.grade,
    required this.numOfQuestions,
    required this.goldStickers,
    required this.silverStickers,
    required this.questions,
    required this.currentQuestion,
    required this.numOfMoves,
    required this.answered,
  });

  static Future<GameBoard> create({
    required String grade,
    required List<String> subjects,
    int numOfQuestions = 1,
    int currentQuestion = 0,
    int numOfMoves = 0,
    required int goldStickers,
    required int silverStickers,
    required int numOfAlbum,
  }) async {
    List<BasicQuestion> questions = [];
    for (String s in subjects) {
      questions.addAll(await _questionsServices.getQuestions(
          grade, s, numOfQuestions ~/ subjects.length, numOfAlbum));
    }
    List<bool> answered = List<bool>.filled(numOfQuestions, false);
    final board = GameBoard(
      grade: grade,
      numOfQuestions: numOfQuestions,
      goldStickers: goldStickers,
      silverStickers: silverStickers,
      questions: questions,
      currentQuestion: currentQuestion,
      numOfMoves: numOfMoves,
      answered: answered,
    );
    String id = await _boardService.addGameBoard(board);
    board.id = id;
    return board;
  }

  factory GameBoard.fromJson(Map<String, dynamic> json) =>
      _$GameBoardFromJson(json);
  Map<String, dynamic> toJson() => _$GameBoardToJson(this);

  BasicQuestion startGame(int currentQuestion) {
    return questions[currentQuestion];
  }

  bool isGameOver(int questionNum) {
    if (questionNum == numOfQuestions - 1) {
      return true;
    } else {
      return false;
    }
  }

  int stepSize(int questionNum, int step) {
    if (questionNum + step < questions.length && questionNum + step > 0) {
      return questionNum + step;
    } else {
      if (questionNum + step > questions.length) {
        return questions.length;
      } else {
        return 0;
      }
    }
  }

  int checkWitchQuestion(int questionNum, int step) {
    int nextQuestionNum = stepSize(questionNum, step);
    if (step > 0) {
      for (int i = questionNum; i < numOfQuestions;) {
        if (!answered[i]) {
          return i;
        }
      }
      return nextQuestionNum;
    } else {
      for (int i = nextQuestionNum; i > questionNum;) {
        if (!answered[i]) {
          return i;
        }
      }
      return nextQuestionNum;
    }
  }

  int positiveOrNegitiveStep(int step, bool nextOrPrev) {
    if (!nextOrPrev) {
      return step * -1;
    } else {
      return step;
    }
  }

  BasicQuestion nextQuestion(int questionNum, bool nextOrPrev, int step) {
    questionNum = questionNum - 1;
    numOfMoves++;
    if (questionNum == 0 && !nextOrPrev) {}
    int transformedStep = positiveOrNegitiveStep(step, nextOrPrev);
    int nextQuestionIndex = checkWitchQuestion(questionNum, transformedStep);
    currentQuestion = nextQuestionIndex;
    answered[questionNum] = true;
    _boardService.update(id, {
      "numOfMoves": numOfMoves,
      "currentQuestion": currentQuestion,
      "answered": answered,
    });
    return questions[nextQuestionIndex];
  }
}
