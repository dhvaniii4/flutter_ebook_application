import 'package:eduvault/utils/import_export.dart';

class SemesterController extends GetxController {
  RxList<SemesterModel> semesters = <SemesterModel>[].obs;
  late DepartmentModel selectedDept;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      selectedDept = Get.arguments;
      fetchSemestersForDept(selectedDept);
    }
  }

  void fetchSemestersForDept(DepartmentModel dept) {
    semesters.value = List.generate(
      6,
      (index) => SemesterModel(id: '${dept.id}-${index + 1}', name: '${dept.name}'),
    );
  }

  void onSemesterSelect(SemesterModel semester) {
    print("Selected Semester: ${semester.name}");
  }
}
