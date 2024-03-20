import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/note_model.dart';

class FirebaseServices {
  //send a note to firebase
  static Future sendNoteToFirebase(NoteModel note) async {
    final documentReference =
        FirebaseFirestore.instance.collection("notes").doc();
    final String docId = documentReference.id;

    final newNoteWithID = note.copyWith(id: docId);
    await documentReference.set(newNoteWithID.toMap());
  }

  //get all notes from firestore
  static Future<List<NoteModel>> getNotesFromFirebase() async {
    final allnotes = await FirebaseFirestore.instance.collection("notes").get();
    return allnotes.docs
        .map((oneDocument) => NoteModel.fromMap(oneDocument.data()))
        .toList();
  }

  //delete a note from firestore
  static Future deleteNoteFromFirebase(String id) async {
    await FirebaseFirestore.instance.collection("notes").doc(id).delete();
  }

  //update a note
}
