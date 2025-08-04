import 'package:eduvault/utils/import_export.dart';

class SubjectController extends GetxController {
  RxList<SubjectModel> subjects = <SubjectModel>[].obs;

  late SemesterModel semester;

  @override
  void onInit() {
    super.onInit();
    semester = Get.arguments as SemesterModel;
    fetchSubjects();
  }

  void fetchSubjects() {
    subjects.value = List.generate(
      6,
      (index) => SubjectModel(
        id: '${semester.id}-sub$index',
        name: 'Subject ${index + 1}',
      ),
    );
  }

}
