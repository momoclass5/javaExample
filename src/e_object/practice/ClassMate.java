package e_object.practice;

public class ClassMate {
    Student[] students = new Student[10];
    Teacher t;

    public void setStucent(Student s) {
        for (int i = 0; i < students.length; i++) {
            if (students[i] == null) {
                students[i] = s;
            }
        }

    }
}
