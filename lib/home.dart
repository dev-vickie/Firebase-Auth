// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'add_note.dart';
import 'firebase_services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Home"),
      ),
      body: FutureBuilder(
        future: FirebaseServices.getNotesFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Text("Something Unexpected Occured");
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: ((context, index) {
              final note = snapshot.data![index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content),
                trailing: IconButton(
                  onPressed: () async {
                    await FirebaseServices.deleteNoteFromFirebase(note.id);
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.delete,
                  ),
                ),
              );
            }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNotePage(),
            ),
          );
        },
      ),
    );
  }
}
