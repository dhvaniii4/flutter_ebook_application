import 'package:eduvault/utils/import_export.dart';

class SubjectBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => SubjectController());
  }
}