import 'package:flutter/material.dart';
import 'package:personal_note_app/add_screen.dart';
import 'package:personal_note_app/detail_screen.dart';
import 'package:personal_note_app/models/note.dart';
import 'package:personal_note_app/services/note_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final NoteService _noteService = NoteService();
  late List<Note> _notes;

  @override
  void initState() {
    super.initState();
    _notes = _noteService.getAllNotes;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTabletOrLarger = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Note App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isTabletOrLarger ? 700 : double.infinity,
            ),
            child: _notes.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Belum ada catatan. Tambahkan catatan baru!',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(
                      vertical: 8, 
                      horizontal: isTabletOrLarger ? 16 : 8,
                    ),
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      final note = _notes[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                        elevation: 2,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, 
                            horizontal: 16,
                          ),
                          title: Text(
                            note.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              note.body,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: isTabletOrLarger ? 14 : 13,
                              ),
                            ),
                          ),
                          trailing: SizedBox(
                            width: 70,
                            child: Text(
                              '${note.createdAt.day}/${note.createdAt.month}/${note.createdAt.year}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  note: note,
                                  onDelete: (id) {
                                    setState(() {
                                      _noteService.deleteNote(id);
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(
                onAdd: (title, body) {
                  setState(() {
                    _noteService.addNote(title, body);
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}