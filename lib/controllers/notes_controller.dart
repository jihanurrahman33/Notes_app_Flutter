import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:notes/models/note_model.dart';

class NotesController extends GetxController {
  RxList<NoteModel> notes = <NoteModel>[].obs;
  RxList<NoteModel> filteredNotes = <NoteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredNotes.assignAll(notes); // Initially display all notes
  }

  // Add note function
  addNote(NoteModel notesData) {
    notes.add(notesData);
    filteredNotes.assignAll(notes); // Update the filtered notes as well
    update();
  }

  // Delete note function
  deleteNote(int index) {
    notes.removeAt(index);
    filteredNotes.assignAll(notes); // Update filtered list after deletion
    update();
  }

  // Update note function
  updateNote(int index, NoteModel notesData) {
    notes[index] = notesData;
    filteredNotes.assignAll(notes); // Update filtered list after modification
    update();
  }

  // Search function
  void searchNotes(String query) {
    if (query.isEmpty) {
      filteredNotes.assignAll(notes); // Show all notes if query is empty
    } else {
      filteredNotes.assignAll(notes.where((note) =>
          note.title.toLowerCase().contains(query.toLowerCase()) ||
          note.description.toLowerCase().contains(query.toLowerCase())));
    }
    update();
  }
}
