// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_test/note_model.dart';
import 'package:flutter/material.dart';

import 'firebase_services.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final titleController = TextEditingController();
  final contentsController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: "Title"),
            ),
            TextField(
              controller: contentsController,
              decoration: InputDecoration(hintText: "contents"),
            ),
            SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () async {
                final NoteModel note = NoteModel(
                  title: titleController.text,
                  content: contentsController.text,
                );
                await FirebaseServices.sendNoteToFirebase(note);
                Navigator.pop(context);
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
