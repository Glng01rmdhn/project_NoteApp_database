import 'package:database_note/models/note_model.dart';
import 'package:database_note/widget/confirm_dialog.dart';
import 'package:database_note/widget/note_card.dart';
import 'package:flutter/material.dart';
import 'package:database_note/pages/note_page.dart';
import '../services/database_helper.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const HomePage({super.key, required this.onToggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 1. DATA & VARIABEL
  List<Note> notes = []; // List utama untuk menampung data dari database

  // 2. FUNGSI DATABASE (CRUD)

  // --- Ambil semua data ---
  Future<void> loadNotes() async {
    final data = await DatabaseHelper.instance.getAllNotes();
    setState(() {
      notes = data; 
    });
  }

  // --- Hapus data dari Card ---
  void deleteNoteFromCard(int id) async {
    bool confirm = await showConfirmDialog(context);
    if (confirm) {
      await DatabaseHelper.instance.deleteNote(id);
      await loadNotes(); 
    }
  }

  // 3. NAVIGASI & LOGIKA SIMPAN

  void goToNotePage({Note? note}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NotePage(note: note)),
    );

    if (result == null) return;

    if (result == "delete" && note?.id != null) {
      // AKSI: HAPUS
      await DatabaseHelper.instance.deleteNote(note!.id!);
    } else if (result is Note) {
      if (note != null) {
        // AKSI: EDIT (Karena datanya sudah ada sebelumnya)
        await DatabaseHelper.instance.updateNote(result);
      } else {
        // AKSI: TAMBAH BARU (Karena datanya kosong)
        await DatabaseHelper.instance.insertNote(result);
      }
    }
    
    // Refresh list agar data terbaru langsung muncul
    loadNotes();
  }

  @override
  void initState() {
    super.initState();
    loadNotes(); 
  }

  // 5. TAMPILAN UTAMA (UI)
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // --- Bagian Atas ---
      appBar: AppBar(
        title: const Text("My Notes"),
        actions: [
          IconButton(
            onPressed: widget.onToggleTheme, 
            icon: const Icon(Icons.dark_mode),
          ),
        ],
      ),

      backgroundColor: theme.scaffoldBackgroundColor,

      // --- Bagian Tengah (Konten) ---
      body: notes.isEmpty
          ? const Center(child: Text("Belum ada catatan")) // Jika kosong
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: notes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Jumlah kolom (2 kolom)
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                final currentNote = notes[index];
                return NoteCard(
                  note: currentNote,
                  onEdit: () => goToNotePage(note: currentNote), 
                  onDelete: () {
                    if (currentNote.id != null) {
                      deleteNoteFromCard(currentNote.id!); 
                    }
                  },
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => goToNotePage(), 
        child: const Icon(Icons.add),
      ),
    );
  }
}