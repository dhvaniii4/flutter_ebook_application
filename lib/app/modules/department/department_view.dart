// import '../../../utils/import_export.dart';
//
// class DepartmentView extends StatelessWidget {
//   DepartmentView({super.key});
//
//   final DepartmentController controller = Get.put(DepartmentController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF8F1EC),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Obx(() {
//           if (controller.department.isEmpty) {
//             return Center(child: CircularProgressIndicator());
//           }
//
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: controller.department.length,
//                   itemBuilder: (context, index) {
//                     final department = controller.department[index];
//                     return DepartmentTile(
//                       department: department,
//                       onClick: () => controller.onDeptSelect(department),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }
// department_view.dart

import 'package:eduvault/utils/import_export.dart';
class DepartmentView extends StatelessWidget {
  DepartmentView({super.key});

  final DepartmentController controller = Get.put(DepartmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F1EC),
      appBar: AppBar(
        backgroundColor: Color(0xFF256D85),
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipOval(
            child: Image.asset(
              'assets/img.png',
              height: 40, // adjust height
              width: 40, // adjust width
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "eDUref",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Obx(() {
          return ListView.builder(
            itemCount: controller.department.length,
            itemBuilder: (context, index) {
              final dept = controller.department[index];
              return DepartmentTile(
                department: dept,
                onClick: () => controller.onDeptSelect(dept),
              );
            },
          );
        }),
      ),
    );
  }
}

