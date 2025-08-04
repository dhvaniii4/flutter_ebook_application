import '../../../utils/import_export.dart';

class DepartmentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DepartmentController>(() => DepartmentController());
  }
}