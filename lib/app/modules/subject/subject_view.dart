import '../../../utils/import_export.dart';

class SubjectView extends StatelessWidget {
  const SubjectView({super.key});

  @override
  Widget build(BuildContext context) {
    SubjectController controller = Get.find<SubjectController>();
    return Scaffold(
      backgroundColor: Color(0xFFF8F1EC),
      appBar: AppBar(
        title: Text('${controller.semester.name} - Subjects'),
        backgroundColor: const Color(0xFF256D85),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.all(12),
      child: Obx(() {
        return ListView.builder(itemCount: controller.subjects.length, itemBuilder: (context, index) {
          final subject =  controller.subjects[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 2),
            child: ListTile(
              tileColor: Colors.white,
              title: Text(
                subject.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              subtitle: Text('Tap to View PDF'),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF256D85), size: 20,),
              onTap: (){},
            ),
          );
        });
      }),
      ),
    );
  }
}
