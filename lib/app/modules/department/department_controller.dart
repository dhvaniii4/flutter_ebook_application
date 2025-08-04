import 'package:eduvault/utils/import_export.dart';

class DepartmentController extends GetxController{
  final department = <DepartmentModel>[].obs;

  @override
  void onInit(){
    super.onInit();
    fetchDepartments();
  }

  void fetchDepartments(){
    department.value = [
      DepartmentModel(id: '1', name: 'B.Tech CSE'),
      DepartmentModel(id: '2', name: 'B.Tech Civil'),
      DepartmentModel(id: '3', name: 'B.Tech ME'),
      DepartmentModel(id: '4', name: 'B.Sc(IT)'),
      DepartmentModel(id: '5', name: 'B.Sc(CS)'),
      DepartmentModel(id: '6', name: 'B.Com(Hons CA)'),
      DepartmentModel(id: '7', name: 'BBA(Hons)'),
      DepartmentModel(id: '8', name: 'B.Sc(Bio)'),
      DepartmentModel(id: '9', name: 'MCA'),
      DepartmentModel(id: '10', name: 'M.Tech(SE)'),
    ];
  }

  void onDeptSelect(DepartmentModel dept) {
    Get.to(() => SemesterView(), arguments: dept);
  }
}