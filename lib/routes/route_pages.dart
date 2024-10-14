import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:notes/routes/route_names.dart';
import 'package:notes/views/home.dart';
import 'package:notes/views/note.dart';

class RoutePages {
  static List<GetPage<dynamic>>? routes = [
    GetPage(
      name: RouteNames.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RouteNames.noteScreen,
      page: () => const NoteScreen(),
    ),
  ];
}
