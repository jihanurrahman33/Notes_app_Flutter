import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/notes_controller.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/utils/colors.dart';
import 'package:notes/widgets/custom_button.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final arg = Get.arguments != null
    //     ? Get.arguments() as Map
    //     : {
    //         'isUpdate': false,
    //         'note': null,
    //       };
    // final bool isUpdate = arg['isUpdate'];
    // final note = arg['note'] == null ? null : arg['note'] as NoteModel;

    final arg = (Get.arguments as Map?) ?? {'isUpdate': false, 'note': null};
    final bool isUpdate = arg['isUpdate'] as bool? ?? false;
    final note = arg['note'] as NoteModel?;
    final index = arg['index'];

    final controller = Get.put(NotesController());
    final titleController = TextEditingController(
      text: isUpdate ? note!.title : null,
    );
    final descriptionController = TextEditingController(
      text: isUpdate ? note!.description : null,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                maxLines: 50,
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Describe about your note.',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(ontap: () {
                    if (titleController.text.isEmpty ||
                        descriptionController.text.isEmpty) {
                      Get.snackbar('Empty Title or description ',
                          'Please write some title and description..');
                    } else {
                      isUpdate
                          ? controller.updateNote(
                              index,
                              NoteModel(
                                title: titleController.text,
                                description: descriptionController.text,
                                createdDate: DateTime.now(),
                                updatedDate: DateTime.now(),
                              ),
                            )
                          : controller.addNote(
                              NoteModel(
                                title: titleController.text,
                                description: descriptionController.text,
                                createdDate: DateTime.now(),
                              ),
                            );
                      Get.back();
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
