import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/note_model.dart';

class EditNoteView extends StatelessWidget {

  Future<void> editNote(int index, String newTitle, String newContent) async {
    var box = await Hive.openBox<NoteModel>('notesBox');
    if (index >= 0 && index < box.length) {
      NoteModel? note = box.getAt(index);
      if (note != null) {
        note.title = newTitle;
        note.content = newContent;
        await box.putAt(index, note);
      }
    } else {
      throw Exception('Note not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 32),
            const TextField(
              decoration:  InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration:InputDecoration(hintText: 'Content'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {},
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
