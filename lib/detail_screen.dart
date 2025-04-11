import 'package:flutter/material.dart';
import 'package:personal_note_app/models/note.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  final Note note;
  final Function(String) onDelete;

  const DetailScreen({super.key, required this.note, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMMM yyyy, HH:mm');
    final formattedDate = dateFormat.format(note.createdAt);

    final size = MediaQuery.of(context).size;
    final isTabletOrLarger = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Catatan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text('Hapus Catatan'),
                      content: const Text(
                        'Apakah Anda yakin ingin menghapus catatan ini?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () {
                            onDelete(note.id);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('Hapus'),
                        ),
                      ],
                    ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: isTabletOrLarger ? 700 : double.infinity,
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(note.body, style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
