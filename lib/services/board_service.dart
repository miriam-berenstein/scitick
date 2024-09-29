import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_3/models/game_board.dart';

class BoardService{
    final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<String> addGameBoard(GameBoard board) async {
    try {
      DocumentReference docRef = await _db
          .collection('boards')
          .add(board.toJson());
      print('Album added successfully with ID: ${docRef.id}');
      return docRef.id;
    } catch (e) {
      print('Failed to add album: $e');
      return '';
    }
  }

    Future<GameBoard> update(String id, Map<String, dynamic> data) async {
    final docRef = _db.collection('boards').doc(id);
    await docRef.update(data);
    return GameBoard.fromJson((await docRef.get()).data() as Map<String, dynamic>);
  }

  // Future<GameBoard> getUser(String id) async {
  //   final docRef = _db.collection('boards').doc(id);
  //   return GameBoard.fromJson((await docRef.get()).data() as Map<String, dynamic>);
  // }

  // Future<List<GameBoard>> getAllUsers() async {
  //   final querySnapshot = await _db.collection('boards').get();
  //   return querySnapshot.docs.map((doc) => GameBoard.fromJson(doc.data())).toList();
  // }

    Future<void> deleteBoard(String id) async {
    try {
      await _db.collection('boards').doc(id).delete();
      print('Board with ID: $id deleted successfully.');
    } catch (e) {
      print('Failed to delete board: $e');
    }
  }
}