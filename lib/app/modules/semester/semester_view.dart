import 'package:eduvault/utils/import_export.dart';

class SemesterView extends StatelessWidget {
  late final DepartmentModel department;


  SemesterView({super.key}) {
    final arg = Get.arguments;
    if (arg is DepartmentModel) {
      department = arg;
    } else {
      throw Exception("DepartmentModel not passed in arguments");
    }
  }

  @override
  Widget build(BuildContext context) {
    final semList = List.generate(8, (index) => 'Semester ${index + 1}');
    return Scaffold(
      backgroundColor: const Color(0xFFF8F1EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF256D85),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          '${department.name}',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: semList.length,
          itemBuilder: (context, index) {
            final sem = semList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: ListTile(
                tileColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                title: Text(
                  sem,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                subtitle: const Text(
                  "Tap to view subjects",
                  style: TextStyle(fontSize: 14, color: Color(0xFF757575)),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF256D85),
                  size: 20,
                ),
                onTap: (){
                  final semester = SemesterModel(
                    id: '${department.id}-sem$index',
                    name: sem,
                  );
                  Get.to(() => SubjectView(), arguments: semester, binding: SubjectBinding());
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
