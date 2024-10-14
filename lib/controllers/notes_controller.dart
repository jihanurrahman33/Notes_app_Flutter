import 'package:get/get.dart';
import 'package:notes/models/note_model.dart';

class NotesController extends GetxController {
  RxList notes = <NoteModel>[].obs;
  addNote(NoteModel notesData) {
    notes.add(notesData);
    update();
  }

  deleteNote(int index) {
    notes.removeAt(index);
    update();
  }

  updateNote(int index, NoteModel notesData) {
    notes[index] = notesData;
    update();
  }
}
