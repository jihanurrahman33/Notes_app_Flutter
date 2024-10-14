import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:notes/controllers/notes_controller.dart';
import 'package:notes/routes/route_names.dart';
import 'package:notes/utils/colors.dart';
import 'package:notes/widgets/custom_single_note.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Obx(() {
                    return SingleChildScrollView(
                      child: controller.notes.isEmpty
                          ? const Center(
                              child: Text(
                                'No notes',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: controller.notes.length,
                              itemBuilder: (context, index) {
                                final note = controller.notes[index];
                                final createdDateFormat = DateFormat.yMMMMd()
                                    .format(note.createdDate);
                                final createTimeFormat =
                                    DateFormat.jm().format(note.createdDate);
                                return CustomSingleNote(
                                  title: note.title,
                                  description: note.description,
                                  date:
                                      '$createdDateFormat - $createTimeFormat',
                                  index: index,
                                );
                              },
                            ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          Get.toNamed(RouteNames.noteScreen);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
