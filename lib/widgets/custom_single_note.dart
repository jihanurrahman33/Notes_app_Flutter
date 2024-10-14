import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/notes_controller.dart';
import 'package:notes/routes/route_names.dart';
import 'package:notes/utils/colors.dart';

class CustomSingleNote extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final int index;
  const CustomSingleNote({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());
    return InkWell(
      onTap: () {
        Get.toNamed(RouteNames.noteScreen, arguments: {
          'isUpdate': true,
          'note': controller.notes[index],
          'index': index,
        });
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
            horizontalTitleGap: 0,
            leading: Container(
              height: 15,
              width: 15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.backgroundColor,
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // ignore: prefer_const_constructors
            subtitle: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                    ),
                    InkWell(
                      child: const Icon(Icons.delete),
                      onTap: () {
                        controller.deleteNote(index);
                      },
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
