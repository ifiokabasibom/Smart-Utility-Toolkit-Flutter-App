import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  final noteController = TextEditingController();

  List<String> notes = [];

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {

    final prefs = await SharedPreferences.getInstance();

    setState(() {
      notes = prefs.getStringList("notes") ?? [];
    });
  }

  Future<void> saveNotes() async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList("notes", notes);
  }

  void addNote() {

    if (noteController.text.isEmpty) return;

    setState(() {

      notes.add(noteController.text);

      noteController.clear();

      saveNotes();
    });
  }

  void deleteNote(int index) {

    setState(() {

      notes.removeAt(index);

      saveNotes();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Notes"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            TextField(
              controller: noteController,
              decoration: const InputDecoration(
                labelText: "Write a note",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: addNote,
              child: const Text("Add Note"),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: notes.isEmpty
                  ? const Center(
                      child: Text(
                        "No notes yet. Add one!",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(notes[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => deleteNote(index),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}