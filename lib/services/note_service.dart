import 'package:personal_note_app/models/note.dart';

class NoteService {
  final List<Note> _notes = noteList;

  List<Note> get getAllNotes => _notes;

  void addNote(String title, String body) {
    final newNote = Note(
      id: 'notes-${DateTime.now().toString()}',
      title: title,
      body: body,
      createdAt: DateTime.now(),
    );

    _notes.add(newNote);
  }

  void deleteNote(String id) {
    _notes.removeWhere((note) => note.id == id);
  }

  Note? getNoteById(String id) {
    try {
      return _notes.firstWhere((note) => note.id == id);
    } catch (e) {
      return null;
    }
  }
}
