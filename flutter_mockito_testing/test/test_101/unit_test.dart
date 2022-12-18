import 'package:flutter_test/flutter_test.dart';

class Student {
  List<String> nameList = [];

  void addStudent(String name) {
    nameList.add(name);
  }

  void removeStudent(String name) {
    nameList.remove(name);
  }
}

void main() {
  group("List processing", () {
    final student = Student();
    test("List should be one after adding a name", () {
      student.addStudent("Oguzhan");
      expect(student.nameList.length, 1);
    });

    test("List should be one after adding a name", () {
      student.addStudent("Ali");
      student.addStudent("Cem");
      student.addStudent("Kemal");
      expect(student.nameList.length, 4);
    });

    test("List should be one after adding a name", () {
      student.removeStudent("Ali");
      student.removeStudent("Kemal");
      expect(student.nameList.length, 2);
    });
  });
}
