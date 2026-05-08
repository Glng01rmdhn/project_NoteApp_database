import 'package:flutter/material.dart';
import '../models/note_model.dart';

class NotePage extends StatefulWidget {
  final Note? note;

  const NotePage({super.key, this.note});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final authorController = TextEditingController();

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
      authorController.text = widget.note!.author;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    authorController.dispose();
    super.dispose();
  }

  void saveNote() {
    if (_isSaving) return;
    
    if (!mounted) return;

    // Input validasi
    if (titleController.text.trim().isEmpty && 
        contentController.text.trim().isEmpty) {
      Navigator.pop(context);
      return;
    }

    setState(() {
      _isSaving = true; 
    });

    final now = DateTime.now().toIso8601String();

    final note = Note(
      title: titleController.text,
      content: contentController.text,
      author: authorController.text,
      createdAt: widget.note?.createdAt ?? now,
      updatedAt: now,
      id: widget.note?.id,
    );

    Navigator.pop(context, note);
  }
// ============= DELETE ===========
  void deleteNote() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Konfirmasi"),
        content: const Text("Yakin ingin menghapus?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Hapus"),
          ),
        ],
      ),
    );

    if (confirm == true) {
      if (!mounted) return;
      Navigator.pop(context, "delete");
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, 
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        saveNote(); 
      },  
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.note == null ? "Tambah Note" : "Edit Note"),
          actions: [
            IconButton(
              onPressed: _isSaving ? null : saveNote, 
              icon: const Icon(Icons.save),
            ),
            if (widget.note != null)
              IconButton(onPressed: deleteNote, icon: const Icon(Icons.delete)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Judul"),
              ),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(labelText: "Isi"),
                maxLines: 3,
              ),
              TextField(
                controller: authorController,
                decoration: const InputDecoration(labelText: "Author"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}