import 'package:eduvault/utils/import_export.dart';

class DepartmentTile extends StatelessWidget {
  final DepartmentModel department;
  final VoidCallback onClick;

  const DepartmentTile({
    Key? key,
    required this.department,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: ListTile(
        tileColor: Colors.white,
        contentPadding:
        EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        title: Text(
          department.name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        subtitle: Text(
          "Tap to view semesters",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF757575),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFF256D85),
          size: 20,
        ),
        onTap: onClick,
      ),
    );
  }
}
