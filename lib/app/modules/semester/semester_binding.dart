import '../../../utils/import_export.dart';

class SemesterBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<SemesterController>(() => SemesterController());
  }
}